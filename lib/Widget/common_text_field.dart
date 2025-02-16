class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? currentFocus, nextFocus;
  final String? hintText, errorMessage;
  final int? maxLine, maxLength;
  final Icon? icon;
  final TextInputType? textInputType;
  final TextInputFormatter? textInputFormatter;
  const CommonTextField({super.key, required this.controller, this.currentFocus, this.nextFocus,required this.hintText, this.maxLine, this.icon, this.errorMessage, this.textInputType, this.maxLength, this.textInputFormatter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: currentFocus,
      maxLines: maxLine??1,
      maxLength: maxLength,
      cursorColor: ColorHelper.primaryColor,
      keyboardType: textInputType??TextInputType.text,
      inputFormatters: textInputFormatter == null? null:[textInputFormatter!],
      style: const TextStyle(color: ColorHelper.black, fontWeight: FontHelper.medium, fontSize: FontHelper.size_20),
      decoration: CustomInputDecoration.getDecoration(
        hintText: hintText??"",
        icon: icon,
      ),
      onFieldSubmitted: (String v){
        FocusScope.of(context).requestFocus(nextFocus);
      },
      validator:
      // validator,
          (val) {
        if(errorMessage!.isNotEmpty){
          if (val!.isEmpty) {
            return errorMessage;
          }
        }
        return null;
      },
    );
  }
}
