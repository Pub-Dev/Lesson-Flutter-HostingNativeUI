package com.example.lesson_flutter_hostingui

import android.content.Context
import android.graphics.Color
import android.text.Editable
import android.view.View
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

internal class NativeView(context: Context?, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView
    private val editText: EditText
    private val linearLayout: LinearLayout

    init {
        textView = TextView(context)
        textView.textSize = 42f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.text = "${creationParams?.get("title")} native Android view (id: $id)"

        editText = EditText(context)
        editText.hint = "Tap and Write here"

        linearLayout = LinearLayout(context)
        linearLayout.orientation = LinearLayout.VERTICAL
        linearLayout.addView(textView)
        linearLayout.addView(editText)
    }

    override fun getView(): View? {
        return linearLayout
    }

    override fun dispose() {}
}