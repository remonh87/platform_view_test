package com.remonh87.platform_view_repro

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout


class CustomButtonView(private val context: Context) : FrameLayout(context) {
    internal var button: View? = null
    private var type: Int? = null

    fun initialize() {
        val resAsset: Int =R.layout.button

        button = LayoutInflater.from(context).inflate(
            resAsset, null
        )

        addView(button)
        viewTreeObserver.addOnGlobalLayoutListener { requestLayout() }
    }

    override fun requestLayout() {
        super.requestLayout()
        post(mLayoutRunnable)
    }

    private val mLayoutRunnable = Runnable {
        measure(
            MeasureSpec.makeMeasureSpec(width, MeasureSpec.EXACTLY),
            MeasureSpec.makeMeasureSpec(height, MeasureSpec.EXACTLY))
        button?.layout(left, top, right, bottom)
    }

    fun setType(type: Int) {
        this.type = type
    }
}
