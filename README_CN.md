# Linux Surface

[简体中文](README_CN.md) | [English](README.md)

> 此仓库 fork 自上游 [linux-surface/linux-surface](https://github.com/linux-surface/linux-surface) 项目，改动后仅适用于 Arch Linux 发行版。下方为上游版本的原始 README 内容。

---

在 Microsoft Surface 设备上运行 Linux。
请按下方说明安装最新内核。

[公告与更新](https://github.com/linux-surface/linux-surface/issues/96) | [上游状态](https://github.com/linux-surface/linux-surface/issues/205)

### 为什么 / 关于本项目

如今，Linux 开箱即用支持大量设备。
事实上，这也覆盖了相当多的 Microsoft Surface 设备——至少在大多数功能上如此。
那么，为什么还需要一个专用于 Surface 的内核？
简而言之：为尚未被上游支持的部分提供支持。

不幸的是，Surface 设备往往有些“特殊”。
这主要是因为微软在硬件上的一些选择很少（甚至几乎没有）被其他更“标准”的设备采用。
例如：

- Surface 设备（第 4 代及之后）使用自有的嵌入式控制器（Surface Aggregator Module，SAM）。
  与其他设备不同，一些较新的 Surface 机型把键盘和触控板的输入也通过该控制器传输。
  但由于 SAM 管理的设备通常无法自动发现，每一款新的 Surface 设备都需要一些（通常很小的）补丁来启用支持。
- Surface 设备（第 4 代及之后，Go 系列除外）使用了较为特殊的触控与手写笔输入系统。
  简而言之，它需要在用户态对触控与笔数据进行处理以实现多点触控支持，而这一方案尚未上游合并。
- Surface 设备依赖 Intel 的 ISP 进行摄像头图像处理。
  这意味着摄像头同样需要用户态处理。
  尽管相关补丁正在上游推进，但并非所有设备都已支持（即使使用本项目），并且仍有大量工作要做。

我们希望将这里的所有改动最终合并到上游，但这需要时间。
这个内核让我们能够更快交付新功能，因为我们不必严格遵循上游的发布节奏（以及其代码规范）。
我们也依赖它来测试与验证补丁，这一点至关重要，因为维护者无法在所有 Surface 设备上进行测试（因此也可能在过程中引入问题）。

_那么你应该安装这个自定义内核及其配套软件包吗？_
这取决于你的情况：我们通常建议先尝试发行版默认内核。
如果它对你来说已经足够好，那就很好！
但如果你缺失某些功能或遇到问题，请查看我们的[特性矩阵](https://github.com/linux-surface/linux-surface/wiki/Supported-Devices-and-Features#feature-matrix)，并尝试我们的内核与软件包。
如果你的设备尚未被列为已支持，欢迎提交 issue。

### 支持的设备

- Surface Book
- Surface Book 2
- Surface Book 3
- Surface 3
- Surface Go
- Surface Go 2
- Surface Go 3
- Surface Laptop
- Surface Laptop 2
- Surface Laptop 3
- Surface Laptop 4
- Surface Laptop 5
- Surface Laptop 6
- Surface Laptop Go
- Surface Laptop Go 2
- Surface Laptop Go 3
- Surface Laptop Studio
- Surface Laptop Studio 2
- Surface Pro 1
- Surface Pro 3
- Surface Pro 4
- Surface Pro（第 5 代）/ Surface Pro 2017
- Surface Pro 6
- Surface Pro 7
- Surface Pro 7+
- Surface Pro 8
- Surface Pro 9
- Surface Pro 10
- Surface Studio

### 功能 / 可用情况

请参考[特性矩阵](https://github.com/linux-surface/linux-surface/wiki/Supported-Devices-and-Features#feature-matrix)了解每款设备的具体支持情况。

### 免责声明

- 大多数测试是在 Surface Book 2 上完成的。
  其他设备虽然普遍反馈可正常工作，但实际情况因设备而异。
  请查看 issues 列表了解可能的例外情况。

## 安装与设置

我们提供包含补丁内核及相关工具的 Arch Linux 软件包仓库。
请参考[详细安装与设置指南][wiki-setup]。
其中还包含可能与设备相关的注意事项。
如果你已启用磁盘加密或计划启用，请务必遵循安装指南中的相关说明，并查看对应的[Wiki 页面][wiki-encryption]。
安装完成后，你可能还希望阅读[Wiki][wiki]以及 `contrib/` 目录中提供的实用调优内容。

如果你想自己编译内核，请参考[Wiki][wiki-compiling]。

## 其他信息

### 备注

- 如果在加载 initramfs 时卡在启动阶段，请安装 Intel 微码包（例如 Arch 上的 `intel-ucode`）。
- 若 TLP 未正确配置，可能导致性能下降、卡顿甚至偶发死机！请谨慎使用。
- 如果你想使用休眠（hibernate）而非挂起（suspend），需要创建交换分区或文件，请遵循发行版的相关说明（也可参考[此处][hibernate-setup]）。

### 支持

如果你有问题或需要帮助，请加入我们的 [Matrix 空间][matrix-space]！
该空间包含：

- 用于一般支持的[支持频道][matrix-support]
- 用于开发相关问题与讨论的[开发频道][matrix-development]

## 许可证

本仓库包含的补丁要么是对已许可源码（即 Linux 内核部分）的派生工作，要么是新增到 Linux 内核的新代码。
因此，除非另有明确说明，这些补丁遵循其所基于源码的许可证；若补丁引入了新代码，则以补丁中明确声明的许可证为准。
请参阅具体补丁与对应源码获取更多信息。
许可证文本可在 <https://github.com/torvalds/linux/tree/master/LICENSES> 获取。

[wiki]: https://github.com/linux-surface/linux-surface/wiki
[wiki-setup]: https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup
[wiki-compiling]: https://github.com/linux-surface/linux-surface/wiki/Compiling-the-Kernel-from-Source
[wiki-encryption]: https://github.com/linux-surface/linux-surface/wiki/Disk-Encryption

[matrix-space]: https://matrix.to/#/#linux-surface:matrix.org
[matrix-support]: https://matrix.to/#/#linux-surface-support:matrix.org
[matrix-development]: https://matrix.to/#/#linux-surface-development:matrix.org

[hibernate-setup]: https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation
