# To-Do-List_NET

Chào bạn!

Rất vui khi biết bạn muốn tự học Entity Framework (EF) trong .NET. Để bắt đầu một cách dễ dàng và hiệu quả, bạn nên chọn một dự án đơn giản nhưng đủ để bạn thực hành các khái niệm cơ bản của EF. Dưới đây là một gợi ý cho dự án đầu tiên của bạn:

### **Dự Án Đề Xuất: Ứng Dụng Quản Lý To-Do List**

**Mô tả:** Tạo một ứng dụng web hoặc desktop đơn giản cho phép người dùng quản lý danh sách việc cần làm (To-Do List). Ứng dụng này sẽ hỗ trợ các chức năng cơ bản như thêm, xem, sửa, và xóa các nhiệm vụ.

#### **Các Bước Thực Hiện:**

1. **Thiết Kế Cơ Sở Dữ Liệu:**
   - **Bảng Task:**
     - `Id` (int, khóa chính, tự động tăng)
     - `Title` (string, tên nhiệm vụ)
     - `Description` (string, mô tả chi tiết)
     - `IsCompleted` (bool, trạng thái hoàn thành)
     - `CreatedAt` (DateTime, ngày tạo)
     - `UpdatedAt` (DateTime, ngày cập nhật)

2. **Tạo Project:**
   - **Web Application:** Sử dụng ASP.NET Core MVC hoặc ASP.NET Core Razor Pages.
   - **Desktop Application:** Sử dụng Windows Forms hoặc WPF.

3. **Cài Đặt Entity Framework:**
   - Sử dụng **Entity Framework Core** cho các dự án .NET Core.
   - Cài đặt thông qua NuGet Package Manager:
     ```bash
     Install-Package Microsoft.EntityFrameworkCore
     Install-Package Microsoft.EntityFrameworkCore.SqlServer
     Install-Package Microsoft.EntityFrameworkCore.Tools
     ```

4. **Tạo DbContext và Các Entity:**
   - Tạo lớp `Task` theo mô tả ở trên.
   - Tạo lớp `AppDbContext` kế thừa từ `DbContext` và định nghĩa `DbSet<Task>`.

   ```csharp
   public class Task
   {
       public int Id { get; set; }
       public string Title { get; set; }
       public string Description { get; set; }
       public bool IsCompleted { get; set; }
       public DateTime CreatedAt { get; set; }
       public DateTime UpdatedAt { get; set; }
   }

   public class AppDbContext : DbContext
   {
       public DbSet<Task> Tasks { get; set; }

       protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
       {
           optionsBuilder.UseSqlServer("Your_Connection_String_Here");
       }
   }
   ```

5. **Thực Hiện Migrations:**
   - Sử dụng lệnh sau để tạo và áp dụng migration:
     ```bash
     dotnet ef migrations add InitialCreate
     dotnet ef database update
     ```

6. **Xây Dựng Giao Diện Người Dùng:**
   - **Thêm Task:** Form để nhập thông tin nhiệm vụ.
   - **Hiển Thị Task:** Danh sách các nhiệm vụ hiện tại.
   - **Sửa Task:** Cho phép cập nhật thông tin nhiệm vụ.
   - **Xóa Task:** Cho phép xóa nhiệm vụ khỏi danh sách.

7. **Thực Hiện CRUD Operations:**
   - **Create:** Thêm nhiệm vụ mới vào cơ sở dữ liệu.
   - **Read:** Lấy danh sách nhiệm vụ từ cơ sở dữ liệu.
   - **Update:** Cập nhật thông tin nhiệm vụ.
   - **Delete:** Xóa nhiệm vụ khỏi cơ sở dữ liệu.

8. **Kiểm Tra và Debug:**
   - Chạy ứng dụng và kiểm tra tất cả các chức năng CRUD hoạt động đúng.
   - Sửa các lỗi phát sinh nếu có.

#### **Lợi Ích Khi Làm Dự Án Này:**

- **Hiểu Rõ CRUD Operations:** Bạn sẽ thực hành thêm, đọc, sửa, và xóa dữ liệu thông qua Entity Framework.
- **Quản Lý Migrations:** Học cách tạo và áp dụng migrations để quản lý thay đổi trong cơ sở dữ liệu.
- **Kết Nối Cơ Sở Dữ Liệu:** Hiểu cách kết nối ứng dụng với cơ sở dữ liệu SQL Server hoặc các nguồn dữ liệu khác.
- **Xây Dựng Giao Diện Người Dùng:** Cải thiện kỹ năng phát triển giao diện người dùng trong .NET.

#### **Tài Nguyên Hữu Ích:**

- **Tài Liệu Chính Thức của Entity Framework Core:** [https://docs.microsoft.com/ef/core/](https://docs.microsoft.com/ef/core/)
- **Hướng Dẫn Tạo Ứng Dụng To-Do List với EF Core:** Có rất nhiều bài hướng dẫn trực tuyến, ví dụ như trên Microsoft Learn hoặc các blog kỹ thuật.
- **Cộng Đồng và Diễn Đàn:** Tham gia các diễn đàn như Stack Overflow hoặc các nhóm trên mạng xã hội để trao đổi và giải đáp thắc mắc.

Chúc bạn thành công trong việc học và phát triển kỹ năng với Entity Framework! Nếu có bất kỳ câu hỏi nào khác, đừng ngần ngại hỏi thêm nhé.