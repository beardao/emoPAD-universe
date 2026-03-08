---
name: emoPAD-universe
description: |
  emoPAD Universe - 情绪宇宙技能

  帮助用户在情绪 PAD（Pleasure-Arousal-Dominance）坐标系中定位情绪，
  并提供 emoNebula 功能：持续实时监测情绪 PAD，每隔 5 分钟弹出窗口显示情绪星云图。

  ## 跨平台支持
  
  支持 Linux 和 Windows 操作系统：
  - **Linux**: 使用 eog (Eye of GNOME) 显示图片窗口
  - **Windows**: 使用系统默认的图片查看器显示

  ## 自动启动
  
  安装此skill后，emoPAD服务和emoNebula会自动启动，无需手动操作。

  ## 支持的硬件
  
  - EEG: KSEEG102 (蓝牙 BLE)
  - PPG: Cheez PPG 传感器 (串口)
  - GSR: Sichiray GSR V2 (串口)
  
  理论上类似的设备都能用。未来将逐步增加对主流品牌的支持，包括：
  - Muse 系列脑电设备
  - Emotiv 脑电设备
  - Oura Ring 智能戒指
  - Whoop 智能手环
  - 其他主流脑电设备和智能穿戴设备

  ## 安装依赖
  
  安装skill时会自动检查并安装所需依赖，无需手动操作。

  ## 使用
  
  - `openclaw emopad status` - 获取当前 PAD 状态
  - `openclaw emopad snapshot` - 手动生成情绪星云图
  - `openclaw emopad stop` - 停止服务
  - `openclaw emopad start` - 重新启动服务

  ## 重要说明
  
  **关于情绪 PAD 计算**: 目前是基于启发式方法，根据大量文献总结得出的映射关系。
  这种方法暂时无法体现个性化差异。未来版本将加入个性化校准训练模块，真正实现个性化情绪识别。
---

# emoPAD Universe

## 跨平台支持

emoPAD Universe 支持以下操作系统：

| 操作系统 | 图片查看器 | 说明 |
|---------|-----------|------|
| Linux | eog (Eye of GNOME) | 窗口模式，可关闭 |
| Windows | 系统默认图片查看器 | 窗口模式，可关闭 |

## 自动启动

安装此skill后，会自动执行以下操作：
1. 检查并安装所需的Python依赖
2. 启动emoPAD服务（监听 http://127.0.0.1:8766）
3. 启动emoNebula自动报告（每5分钟弹出窗口显示情绪星云图）

无需手动启动，安装完成后即可使用。

## 工具

### emopad_status

获取当前情绪 PAD 状态和传感器连接情况

**描述**: 返回愉悦度(Pleasure)、唤醒度(Arousal)、支配度(Dominance)三个维度的数值，以及EEG、PPG、GSR三个传感器的连接状态

**参数**: 无

**返回**: 格式化的情绪状态文本，包含传感器连接状态

---

### emopad_snapshot

生成当前情绪星云图

**描述**: 生成 3D PAD 立方体可视化截图

**参数**: 无

**返回**: 
- 状态消息
- PNG 图片数据

---

### emopad_start_nebula

启动 emoNebula 自动报告

**描述**: 每 5 分钟自动生成并弹出窗口显示情绪星云图。需要至少2个传感器连接才会显示图片，否则显示数据缺失提醒。

**参数**: 无

**返回**: 状态消息

---

### emopad_stop_nebula

停止 emoNebula 自动报告

**描述**: 停止自动显示情绪星云图

**参数**: 无

**返回**: 状态消息

## 配置

```yaml
serial_port: /dev/ttyACM0      # 串口设备路径 (Linux)
# serial_port: COM3            # 串口设备路径 (Windows)
baudrate: 115200               # 串口波特率
eeg_window_sec: 2              # EEG数据窗口（秒）
ppg_gsr_window_sec: 60         # PPG/GSR数据窗口（秒）
hop_sec: 2                     # 计算间隔（秒）
history_length: 120            # 历史数据点数量
nebula_interval: 300           # 发送间隔（秒）
service_host: 127.0.0.1        # 服务监听地址
service_port: 8766             # 服务监听端口
```

## 依赖

- mne
- heartpy
- neurokit2
- bleak
- pyvista
- pyserial
- scipy
- numpy
- PyWavelets
- fastapi
- uvicorn
- pillow
- requests
- pyyaml

## 硬件支持

### 当前支持的设备

| 类型 | 型号 | 连接方式 |
|------|------|----------|
| EEG | KSEEG102 | 蓝牙 BLE |
| PPG | Cheez PPG 传感器 | 串口 |
| GSR | Sichiray GSR V2 | 串口 |

### 未来计划支持的设备

- Muse 系列脑电设备
- Emotiv 脑电设备
- Oura Ring 智能戒指
- Whoop 智能手环
- 其他主流脑电设备和智能穿戴设备

## 关于情绪 PAD 计算

**重要说明**: 目前情绪 PAD 的计算是基于启发式方法，根据大量文献总结得出的映射关系。

这种方法的特点：
- ✅ 基于科学文献的统计规律
- ✅ 适用于一般人群的情绪识别
- ⚠️ 暂时无法体现个性化差异

**未来改进**: 将在新版本中引入个性化校准训练模块，通过用户特定的数据训练，实现真正的个性化情绪识别。
