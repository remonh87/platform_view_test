package com.remonh87.platform_view_repro

import android.content.Context
import android.view.View
import android.widget.FrameLayout
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

internal class NativeView(context: Context,
                          private val channel: MethodChannel,
                          id: Int,
                          creationParams: Map<String?, Any?>?,
) : PlatformView {
    private val layout: CustomButtonView

    override fun getView(): View {
        return layout
    }

    override fun dispose() {}

    init {
       layout= CustomButtonView(context)
        layout.initialize()

        layout.button?.isClickable=true
        layout.button?.setOnClickListener {
            channel.invokeMethod("onPressed", null)
        }



    }
}