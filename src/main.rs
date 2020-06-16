use winrt::*;

// Now use the `import` macro to import the desired winmd files and types:
import!(
    dependencies
        os
    types
        windows::data::xml::dom::*
        windows::foundation::*
        windows::ui::*
);

// Finally, make use of any WinRT APIs as needed. For example, here is
// an example of using the `XmlDocument` class to parse an XML document:
// https://docs.microsoft.com/en-us/uwp/api/windows.devices.input?view=winrt-19041
fn main() -> Result<()> {
    use windows::data::xml::dom::*;

    let doc = XmlDocument::new()?;
    doc.load_xml("<html>hello world</html>")?;

    let root = doc.document_element()?;
    assert!(root.node_name()? == "html");
    assert!(root.inner_text()? == "hello world");

    Ok(())
}
