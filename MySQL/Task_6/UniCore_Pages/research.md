## 1. GET vs POST
The **`method`** attribute in the `<form>` tag defines how the data of the form will be sent to the server.

- **GET**: Appends the data as query parameters to the URL.
  - Less secure as the data is visible in the URL, history, and logs.
  - Example: `www.gebnaestanboly.com/register?username=howaida&password=555`

- **POST**: Sends the data in the HTTP request body, not in the URL.
  - More secure than GET because the data is not visible in the URL.
  - Used for submitting or modifying data.

**Conclusion:** POST is better than GET for forms containing sensitive information like email and password.

---

## 2. Semantic HTML
- A website can be designed using only `<div>` tags, but semantic HTML tags like `<header>`, `<main>`, `<section>`, and `<footer>` are preferred.
- **Benefits:**
  - Improves **readability** of the code.
  - Enhances **accessibility** for screen readers and assistive technologies.
  - Helps search engines understand page content (**SEO benefits**).

---

## 3. The Request/Response Cycle
When you type `google.com` and press Enter, the browser follows these steps:

1. **Browser cache checking:**
   - Checks if it already knows the IP address for `google.com` from previous visits.
   - If not, proceeds to DNS lookup.

2. **DNS lookup:**
   - The browser asks a DNS server to translate `google.com` into an IP address (e.g., `142.250.190.14`).

3. **TCP connection:**
   - Browser establishes a TCP connection to the server at the resolved IP (port 80 for HTTP, 443 for HTTPS).
   - For HTTPS, a TLS handshake secures the connection.

4. **HTTP Request:**
   - Browser sends an HTTP request asking for the page `/`.

5. **Server processing:**
   - Server receives the request, processes it, and prepares an HTTP response (HTML, CSS, JS, images).

6. **HTTP Response:**
   - Server sends the response with a status code (e.g., 200 OK) and the content.

7. **Rendering:**
   - Browser parses HTML, requests CSS/JS/images, constructs the DOM, and renders the page.

8. **Closing connection:**
   - TCP connection may close or be reused for future requests, depending on HTTP version.

