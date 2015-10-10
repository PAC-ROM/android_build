# Target-specific configuration

# Enable DirectTrack on QCOM legacy boards
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)

    TARGET_GLOBAL_CFLAGS += -DQCOM_HARDWARE
    TARGET_GLOBAL_CPPFLAGS += -DQCOM_HARDWARE

    ifeq ($(TARGET_USES_QCOM_BSP),true)
        TARGET_GLOBAL_CFLAGS += -DQCOM_BSP
        TARGET_GLOBAL_CPPFLAGS += -DQCOM_BSP
    endif

    # Tell HALs that we're compiling an AOSP build with an in-line kernel
    TARGET_COMPILE_WITH_MSM_KERNEL := true

    # Enable DirectTrack for legacy targets
    ifneq ($(filter caf bfam,$(TARGET_QCOM_AUDIO_VARIANT)),)
        ifeq ($(BOARD_USES_LEGACY_ALSA_AUDIO),true)
            TARGET_GLOBAL_CFLAGS += -DQCOM_DIRECTTRACK
            TARGET_GLOBAL_CPPFLAGS += -DQCOM_DIRECTTRACK
        endif
    endif
endif
