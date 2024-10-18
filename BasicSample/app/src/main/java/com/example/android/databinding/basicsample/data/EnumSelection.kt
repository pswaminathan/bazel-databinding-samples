package com.example.android.databinding.basicsample.data

import kotlin.reflect.KProperty

@Retention(AnnotationRetention.SOURCE)
@Target(AnnotationTarget.CLASS)
annotation class EnumSelection


abstract class Selection<T>(private val default: T) {
    abstract val options: List<T>

    var invalidationHandle: (()->Unit)? = null
    var value = default
        set(value) {
            field = value
            invalidationHandle?.invoke()
        }

    val isDefault get() = default == value

    class Option<T>(private val option: T) {
        operator fun getValue(thisRef: Selection<T>, property: KProperty<*>): Boolean {
            return thisRef.value == option
        }
        operator fun setValue(thisRef: Selection<T>, property: KProperty<*>, v: Boolean) {
            if (v) {
                thisRef.value = option
            }
        }
    }
}
