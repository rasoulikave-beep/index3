<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ثبت سفارش | CinnaGen</title>

    <style>
        * {
            box-sizing: border-box;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #fff7ed, #fef3c7);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 480px;
        }

        .card {
            background: white;
            border-radius: 22px;
            padding: 35px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.12);
            border: 1px solid #fed7aa;
        }

        .logo-area {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo {
            width: 70px;
            height: 70px;
            margin: 0 auto 12px;
            border-radius: 18px;
            background: linear-gradient(135deg, #f97316, #ea580c);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 28px;
            font-weight: bold;
            box-shadow: 0 8px 20px rgba(249, 115, 22, 0.3);
        }

        .title {
            color: #9a3412;
            font-size: 24px;
            font-weight: 700;
            margin: 0;
        }

        .subtitle {
            color: #78716c;
            font-size: 13px;
            margin-top: 7px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #44403c;
            font-size: 14px;
            font-weight: 600;
        }

        .required {
            color: #ea580c;
        }

        input {
            width: 100%;
            padding: 14px 16px;
            border: 1.5px solid #e7e5e4;
            border-radius: 12px;
            font-size: 15px;
            outline: none;
            transition: all 0.2s ease;
            background: #fafaf9;
        }

        input:focus {
            border-color: #f97316;
            background: white;
            box-shadow: 0 0 0 4px rgba(249, 115, 22, 0.1);
        }

        input::placeholder {
            color: #a8a29e;
        }

        button {
            width: 100%;
            border: none;
            border-radius: 13px;
            padding: 15px;
            margin-top: 8px;
            background: linear-gradient(135deg, #f97316, #ea580c);
            color: white;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 8px 18px rgba(234, 88, 12, 0.25);
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 24px rgba(234, 88, 12, 0.3);
        }

        button:active {
            transform: translateY(0);
        }

        button:disabled {
            opacity: 0.7;
            cursor: not-allowed;
            transform: none;
        }

        .message {
            display: none;
            margin-top: 18px;
            padding: 13px;
            border-radius: 10px;
            text-align: center;
            font-size: 14px;
        }

        .success {
            display: block;
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
        }

        .error {
            display: block;
            background: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            color: #a8a29e;
            font-size: 11px;
        }

        @media (max-width: 500px) {
            .card {
                padding: 25px 20px;
            }

            .title {
                font-size: 21px;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <div class="card">

        <div class="logo-area">
            <div class="logo">C</div>

            <h1 class="title">ثبت سفارش</h1>

            <div class="subtitle">
                سامانه ثبت و ارسال سفارش
            </div>
        </div>

        <form id="orderForm">

            <!-- سفارش دهنده -->
            <div class="form-group">
                <label for="requester">
                    سفارش‌دهنده <span class="required">*</span>
                </label>

                <input
                    type="text"
                    id="requester"
                    name="requester"
                    placeholder="نام سفارش‌دهنده"
                    required
                >
            </div>

            <!-- کد موجودی -->
            <div class="form-group">
                <label for="inventoryCode">
                    کد موجودی <span class="required">*</span>
                </label>

                <input
                    type="text"
                    id="inventoryCode"
                    name="inventoryCode"
                    placeholder="کد موجودی را وارد کنید"
                    required
                >
            </div>

            <!-- مقدار سفارش -->
            <div class="form-group">
                <label for="quantity">
                    مقدار سفارش <span class="required">*</span>
                </label>

                <input
                    type="number"
                    id="quantity"
                    name="quantity"
                    placeholder="مقدار مورد نیاز"
                    min="1"
                    required
                >
            </div>

            <!-- شماره سفارش -->
            <div class="form-group">
                <label for="orderNumber">
                    شماره سفارش <span class="required">*</span>
                </label>

                <input
                    type="text"
                    id="orderNumber"
                    name="orderNumber"
                    placeholder="شماره سفارش"
                    required
                >
            </div>

            <button type="submit" id="submitBtn">
                ارسال سفارش
            </button>

        </form>

        <div id="message" class="message"></div>

        <div class="footer">
            CinnaGen · Supply Planning
        </div>

    </div>

</div>


<script>

    const webhookURL =
        "https://kaveh700.app.n8n.cloud/webhook/ddf55c76-c2b1-4393-a2bb-4827d9c9ffaa";

    const form = document.getElementById("orderForm");
    const button = document.getElementById("submitBtn");
    const message = document.getElementById("message");


    form.addEventListener("submit", async function(event) {

        event.preventDefault();

        // بررسی فیلدهای اجباری
        if (!form.checkValidity()) {
            form.reportValidity();
            return;
        }

        button.disabled = true;
        button.innerText = "در حال ارسال...";

        message.className = "message";
        message.style.display = "none";

        // ساخت اطلاعات فرم
        const data = {
            requester: document.getElementById("requester").value.trim(),
            inventoryCode: document.getElementById("inventoryCode").value.trim(),
            quantity: Number(document.getElementById("quantity").value),
            orderNumber: document.getElementById("orderNumber").value.trim(),

            submittedAt: new Date().toISOString()
        };


        try {

            const response = await fetch(webhookURL, {

                method: "POST",

                headers: {
                    "Content-Type": "application/json"
                },

                body: JSON.stringify(data)

            });


            if (!response.ok) {
                throw new Error("خطا در ارسال اطلاعات");
            }


            // موفقیت
            message.className = "message success";
            message.innerText =
                "✓ سفارش با موفقیت ارسال شد.";

            message.style.display = "block";


            // پاک کردن فرم
            form.reset();


        } catch (error) {

            console.error(error);

            message.className = "message error";
            message.innerText =
                "✕ ارسال سفارش ناموفق بود. اتصال به سرور را بررسی کنید.";

            message.style.display = "block";

        } finally {

            button.disabled = false;
            button.innerText = "ارسال سفارش";

        }

    });

</script>

</body>
</html>
