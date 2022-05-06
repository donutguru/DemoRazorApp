FROM mcr.microsoft.com/dotnet/sdk:6.0 AS publish
WORKDIR /src
COPY . .
RUN dotnet restore "DemoRazorApp/DemoRazorApp.csproj"
WORKDIR "/src/DemoRazorApp"
RUN dotnet publish "DemoRazorApp.csproj" -c Release -o /app/publish
WORKDIR /src
COPY ./version.txt /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
EXPOSE 80
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DemoRazorApp.dll"]