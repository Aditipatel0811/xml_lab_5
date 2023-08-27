from lxml import etree

try:
    # Load XML and XSD files
    xml_tree = etree.parse("products.xml")
    xsd = etree.XMLSchema(etree.parse("product_schema.xsd"))

    # Validate XML against XSD
    validation_result = xsd.validate(xml_tree)
    if validation_result:
        print("XML validation successful.")
    else:
        print("XML validation failed.")
        print("Validation errors:")
        for error in xsd.error_log:
            print(error)

    # XSLT Transformation
    xsl_tree = etree.parse("transform.xsl")
    transform = etree.XSLT(xsl_tree)
    html_output = transform(xml_tree)

    # Save transformed HTML to a file
    with open("output.html", "wb") as f:
        f.write(etree.tostring(html_output, pretty_print=True))

    print("HTML transformation successful. Output saved as output.html.")

except Exception as e:
    print("An error occurred:")
    print(e)
