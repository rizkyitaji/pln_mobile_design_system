// ignore_for_file: deprecated_member_use

import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppRoundedTextFormField extends StatelessWidget {
  final Object groupId;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? forceErrorText;
  final InputDecoration? decoration;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool expands;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? ignorePointers;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final bool? selectAllOnFocus;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final UndoHistoryController? undoController;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final bool? cursorOpacityAnimates;
  final ui.BoxHeightStyle? selectionHeightStyle;
  final ui.BoxWidthStyle? selectionWidthStyle;
  final DragStartBehavior dragStartBehavior;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final MaterialStatesController? statesController;
  final Clip clipBehavior;
  final bool scribbleEnabled;
  final bool stylusHandwritingEnabled;
  final bool canRequestFocus;
  final List<Locale>? hintLocales;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final FormFieldErrorBuilder? errorBuilder;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final bool onTapAlwaysCalled;
  final TapRegionCallback? onTapOutside;
  final TapRegionUpCallback? onTapUpOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;

  const AppRoundedTextFormField({
    super.key,
    this.groupId = EditableText,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.forceErrorText,
    this.decoration,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.expands = false,
    this.inputFormatters,
    this.enabled,
    this.ignorePointers,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.cursorErrorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection,
    this.selectAllOnFocus,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.mouseCursor,
    this.contextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.undoController,
    this.onAppPrivateCommand,
    this.cursorOpacityAnimates,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.dragStartBehavior = DragStartBehavior.start,
    this.contentInsertionConfiguration,
    this.statesController,
    this.clipBehavior = Clip.hardEdge,
    this.scribbleEnabled = true,
    this.stylusHandwritingEnabled =
        EditableText.defaultStylusHandwritingEnabled,
    this.canRequestFocus = true,
    this.hintLocales,
    this.validator,
    this.onSaved,
    this.errorBuilder,
    this.onChanged,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.onTapOutside,
    this.onTapUpOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
  }) : assert(initialValue == null || controller == null);

  @override
  Widget build(BuildContext context) {
    final defaultDecoration = InputDecoration(
      hintText: hintText,
      labelText: labelText,
      fillColor: AppColors.white,
      border: OutlineInputBorder(borderRadius: AppRadius.rounded8),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.rounded8,
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.rounded8,
        borderSide: const BorderSide(color: AppColors.border),
      ),
    );

    return TextFormField(
      groupId: groupId,
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      forceErrorText: forceErrorText,
      decoration: defaultDecoration
          .copyWith(
            hintText: decoration?.hintText ?? hintText,
            labelText: decoration?.labelText ?? labelText,
          )
          .copyWith(
            icon: decoration?.icon,
            iconColor: decoration?.iconColor,
            label: decoration?.label,
            floatingLabelStyle: decoration?.floatingLabelStyle,
            helperText: decoration?.helperText,
            helperStyle: decoration?.helperStyle,
            helperMaxLines: decoration?.helperMaxLines,
            hintFadeDuration: decoration?.hintFadeDuration,
            error: decoration?.error,
            errorText: decoration?.errorText,
            errorStyle: decoration?.errorStyle,
            errorMaxLines: decoration?.errorMaxLines,
            floatingLabelBehavior: decoration?.floatingLabelBehavior,
            floatingLabelAlignment: decoration?.floatingLabelAlignment,
            isCollapsed: decoration?.isCollapsed,
            isDense: decoration?.isDense,
            contentPadding: decoration?.contentPadding,
            prefixIcon: decoration?.prefixIcon,
            prefixIconConstraints: decoration?.prefixIconConstraints,
            prefix: decoration?.prefix,
            prefixText: decoration?.prefixText,
            prefixStyle: decoration?.prefixStyle,
            prefixIconColor: decoration?.prefixIconColor,
            suffixIcon: decoration?.suffixIcon,
            suffix: decoration?.suffix,
            suffixText: decoration?.suffixText,
            suffixStyle: decoration?.suffixStyle,
            suffixIconColor: decoration?.suffixIconColor,
            suffixIconConstraints: decoration?.suffixIconConstraints,
            counter: decoration?.counter,
            counterText: decoration?.counterText,
            counterStyle: decoration?.counterStyle,
            filled: decoration?.filled,
            fillColor: decoration?.fillColor,
            focusColor: decoration?.focusColor,
            hoverColor: decoration?.hoverColor,
            errorBorder: decoration?.errorBorder,
            focusedBorder:
                decoration?.focusedBorder ?? defaultDecoration.focusedBorder,
            focusedErrorBorder: decoration?.focusedErrorBorder,
            disabledBorder: decoration?.disabledBorder,
            enabledBorder:
                decoration?.enabledBorder ?? defaultDecoration.enabledBorder,
            border: decoration?.border ?? defaultDecoration.border,
            enabled: decoration?.enabled,
            semanticCounterText: decoration?.semanticCounterText,
            alignLabelWithHint: decoration?.alignLabelWithHint,
            constraints: decoration?.constraints,
          ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      style: style,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus,
      readOnly: readOnly,
      toolbarOptions: toolbarOptions,
      showCursor: showCursor,
      obscuringCharacter: obscuringCharacter,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      maxLengthEnforcement: maxLengthEnforcement,
      minLines: minLines,
      maxLines: maxLines,
      expands: expands,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      enabled: enabled,
      ignorePointers: ignorePointers,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorColor: cursorColor,
      cursorErrorColor: cursorErrorColor,
      keyboardAppearance: keyboardAppearance,
      scrollPadding: scrollPadding,
      enableInteractiveSelection: enableInteractiveSelection,
      selectAllOnFocus: selectAllOnFocus,
      selectionControls: selectionControls,
      buildCounter: buildCounter,
      scrollPhysics: scrollPhysics,
      autofillHints: autofillHints,
      autovalidateMode: autovalidateMode,
      scrollController: scrollController,
      restorationId: restorationId,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      mouseCursor: mouseCursor,
      contextMenuBuilder: contextMenuBuilder,
      spellCheckConfiguration: spellCheckConfiguration,
      magnifierConfiguration: magnifierConfiguration,
      undoController: undoController,
      onAppPrivateCommand: onAppPrivateCommand,
      cursorOpacityAnimates: cursorOpacityAnimates,
      selectionHeightStyle: selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle,
      dragStartBehavior: dragStartBehavior,
      contentInsertionConfiguration: contentInsertionConfiguration,
      statesController: statesController,
      clipBehavior: clipBehavior,
      scribbleEnabled: scribbleEnabled,
      stylusHandwritingEnabled: stylusHandwritingEnabled,
      canRequestFocus: canRequestFocus,
      hintLocales: hintLocales,
      validator: validator,
      onSaved: onSaved,
      errorBuilder: errorBuilder,
      onChanged: onChanged,
      onTap: onTap,
      onTapAlwaysCalled: onTapAlwaysCalled,
      onTapOutside: onTapOutside,
      onTapUpOutside: onTapUpOutside,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
