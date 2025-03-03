; ModuleID = '../data/hip_kernels/13511/2/main.cu'
source_filename = "../data/hip_kernels/13511/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.SHA256_CTX = type { [64 x i8], i32, [2 x i32], [8 x i32] }

@k = protected addrspace(1) externally_initialized global [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast ([64 x i32] addrspace(1)* @k to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12sha256_finalP10SHA256_CTXPh(%struct.SHA256_CTX addrspace(1)* %0, i8 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #1 {
  %3 = alloca [64 x i32], align 16, addrspace(5)
  %4 = alloca [64 x i32], align 16, addrspace(5)
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14
  %16 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 1
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = icmp ult i32 %17, 56
  %19 = zext i32 %17 to i64
  %20 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 %19
  store i8 -128, i8 addrspace(1)* %20, align 1, !tbaa !12
  %21 = add i32 %17, 1
  br i1 %18, label %22, label %30

22:                                               ; preds = %2
  %23 = icmp ult i32 %21, 56
  br i1 %23, label %24, label %1114

24:                                               ; preds = %22, %24
  %25 = phi i32 [ %28, %24 ], [ %21, %22 ]
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 %26
  store i8 0, i8 addrspace(1)* %27, align 1, !tbaa !12
  %28 = add nuw nsw i32 %25, 1
  %29 = icmp ult i32 %25, 55
  br i1 %29, label %24, label %1114, !llvm.loop !13

30:                                               ; preds = %2
  %31 = icmp ult i32 %21, 64
  br i1 %31, label %32, label %38

32:                                               ; preds = %30, %32
  %33 = phi i32 [ %36, %32 ], [ %21, %30 ]
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 %34
  store i8 0, i8 addrspace(1)* %35, align 1, !tbaa !12
  %36 = add nuw nsw i32 %33, 1
  %37 = icmp ult i32 %33, 63
  br i1 %37, label %32, label %38, !llvm.loop !15

38:                                               ; preds = %32, %30
  %39 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %15, i64 0, i32 0, i64 0
  %40 = bitcast [64 x i32] addrspace(5)* %4 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 256, i8 addrspace(5)* %40) #4
  %41 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !12
  %42 = zext i8 %41 to i32
  %43 = shl nuw i32 %42, 24
  %44 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 1
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !12
  %46 = zext i8 %45 to i32
  %47 = shl nuw nsw i32 %46, 16
  %48 = or i32 %47, %43
  %49 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 2
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !12
  %51 = zext i8 %50 to i32
  %52 = shl nuw nsw i32 %51, 8
  %53 = or i32 %48, %52
  %54 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 3
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !12
  %56 = zext i8 %55 to i32
  %57 = or i32 %53, %56
  %58 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 0
  store i32 %57, i32 addrspace(5)* %58, align 16, !tbaa !16
  %59 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 4
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !12
  %61 = zext i8 %60 to i32
  %62 = shl nuw i32 %61, 24
  %63 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 5
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !12
  %65 = zext i8 %64 to i32
  %66 = shl nuw nsw i32 %65, 16
  %67 = or i32 %66, %62
  %68 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 6
  %69 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !12
  %70 = zext i8 %69 to i32
  %71 = shl nuw nsw i32 %70, 8
  %72 = or i32 %67, %71
  %73 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 7
  %74 = load i8, i8 addrspace(1)* %73, align 1, !tbaa !12
  %75 = zext i8 %74 to i32
  %76 = or i32 %72, %75
  %77 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 1
  store i32 %76, i32 addrspace(5)* %77, align 4, !tbaa !16
  %78 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 8
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !12
  %80 = zext i8 %79 to i32
  %81 = shl nuw i32 %80, 24
  %82 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 9
  %83 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !12
  %84 = zext i8 %83 to i32
  %85 = shl nuw nsw i32 %84, 16
  %86 = or i32 %85, %81
  %87 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 10
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !12
  %89 = zext i8 %88 to i32
  %90 = shl nuw nsw i32 %89, 8
  %91 = or i32 %86, %90
  %92 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 11
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !12
  %94 = zext i8 %93 to i32
  %95 = or i32 %91, %94
  %96 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 2
  store i32 %95, i32 addrspace(5)* %96, align 8, !tbaa !16
  %97 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 12
  %98 = load i8, i8 addrspace(1)* %97, align 1, !tbaa !12
  %99 = zext i8 %98 to i32
  %100 = shl nuw i32 %99, 24
  %101 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 13
  %102 = load i8, i8 addrspace(1)* %101, align 1, !tbaa !12
  %103 = zext i8 %102 to i32
  %104 = shl nuw nsw i32 %103, 16
  %105 = or i32 %104, %100
  %106 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 14
  %107 = load i8, i8 addrspace(1)* %106, align 1, !tbaa !12
  %108 = zext i8 %107 to i32
  %109 = shl nuw nsw i32 %108, 8
  %110 = or i32 %105, %109
  %111 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 15
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !12
  %113 = zext i8 %112 to i32
  %114 = or i32 %110, %113
  %115 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 3
  store i32 %114, i32 addrspace(5)* %115, align 4, !tbaa !16
  %116 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 16
  %117 = load i8, i8 addrspace(1)* %116, align 1, !tbaa !12
  %118 = zext i8 %117 to i32
  %119 = shl nuw i32 %118, 24
  %120 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 17
  %121 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !12
  %122 = zext i8 %121 to i32
  %123 = shl nuw nsw i32 %122, 16
  %124 = or i32 %123, %119
  %125 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 18
  %126 = load i8, i8 addrspace(1)* %125, align 1, !tbaa !12
  %127 = zext i8 %126 to i32
  %128 = shl nuw nsw i32 %127, 8
  %129 = or i32 %124, %128
  %130 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 19
  %131 = load i8, i8 addrspace(1)* %130, align 1, !tbaa !12
  %132 = zext i8 %131 to i32
  %133 = or i32 %129, %132
  %134 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 4
  store i32 %133, i32 addrspace(5)* %134, align 16, !tbaa !16
  %135 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 20
  %136 = load i8, i8 addrspace(1)* %135, align 1, !tbaa !12
  %137 = zext i8 %136 to i32
  %138 = shl nuw i32 %137, 24
  %139 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 21
  %140 = load i8, i8 addrspace(1)* %139, align 1, !tbaa !12
  %141 = zext i8 %140 to i32
  %142 = shl nuw nsw i32 %141, 16
  %143 = or i32 %142, %138
  %144 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 22
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !12
  %146 = zext i8 %145 to i32
  %147 = shl nuw nsw i32 %146, 8
  %148 = or i32 %143, %147
  %149 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 23
  %150 = load i8, i8 addrspace(1)* %149, align 1, !tbaa !12
  %151 = zext i8 %150 to i32
  %152 = or i32 %148, %151
  %153 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 5
  store i32 %152, i32 addrspace(5)* %153, align 4, !tbaa !16
  %154 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 24
  %155 = load i8, i8 addrspace(1)* %154, align 1, !tbaa !12
  %156 = zext i8 %155 to i32
  %157 = shl nuw i32 %156, 24
  %158 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 25
  %159 = load i8, i8 addrspace(1)* %158, align 1, !tbaa !12
  %160 = zext i8 %159 to i32
  %161 = shl nuw nsw i32 %160, 16
  %162 = or i32 %161, %157
  %163 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 26
  %164 = load i8, i8 addrspace(1)* %163, align 1, !tbaa !12
  %165 = zext i8 %164 to i32
  %166 = shl nuw nsw i32 %165, 8
  %167 = or i32 %162, %166
  %168 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 27
  %169 = load i8, i8 addrspace(1)* %168, align 1, !tbaa !12
  %170 = zext i8 %169 to i32
  %171 = or i32 %167, %170
  %172 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 6
  store i32 %171, i32 addrspace(5)* %172, align 8, !tbaa !16
  %173 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 28
  %174 = load i8, i8 addrspace(1)* %173, align 1, !tbaa !12
  %175 = zext i8 %174 to i32
  %176 = shl nuw i32 %175, 24
  %177 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 29
  %178 = load i8, i8 addrspace(1)* %177, align 1, !tbaa !12
  %179 = zext i8 %178 to i32
  %180 = shl nuw nsw i32 %179, 16
  %181 = or i32 %180, %176
  %182 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 30
  %183 = load i8, i8 addrspace(1)* %182, align 1, !tbaa !12
  %184 = zext i8 %183 to i32
  %185 = shl nuw nsw i32 %184, 8
  %186 = or i32 %181, %185
  %187 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 31
  %188 = load i8, i8 addrspace(1)* %187, align 1, !tbaa !12
  %189 = zext i8 %188 to i32
  %190 = or i32 %186, %189
  %191 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 7
  store i32 %190, i32 addrspace(5)* %191, align 4, !tbaa !16
  %192 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 32
  %193 = load i8, i8 addrspace(1)* %192, align 1, !tbaa !12
  %194 = zext i8 %193 to i32
  %195 = shl nuw i32 %194, 24
  %196 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 33
  %197 = load i8, i8 addrspace(1)* %196, align 1, !tbaa !12
  %198 = zext i8 %197 to i32
  %199 = shl nuw nsw i32 %198, 16
  %200 = or i32 %199, %195
  %201 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 34
  %202 = load i8, i8 addrspace(1)* %201, align 1, !tbaa !12
  %203 = zext i8 %202 to i32
  %204 = shl nuw nsw i32 %203, 8
  %205 = or i32 %200, %204
  %206 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 35
  %207 = load i8, i8 addrspace(1)* %206, align 1, !tbaa !12
  %208 = zext i8 %207 to i32
  %209 = or i32 %205, %208
  %210 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 8
  store i32 %209, i32 addrspace(5)* %210, align 16, !tbaa !16
  %211 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 36
  %212 = load i8, i8 addrspace(1)* %211, align 1, !tbaa !12
  %213 = zext i8 %212 to i32
  %214 = shl nuw i32 %213, 24
  %215 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 37
  %216 = load i8, i8 addrspace(1)* %215, align 1, !tbaa !12
  %217 = zext i8 %216 to i32
  %218 = shl nuw nsw i32 %217, 16
  %219 = or i32 %218, %214
  %220 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 38
  %221 = load i8, i8 addrspace(1)* %220, align 1, !tbaa !12
  %222 = zext i8 %221 to i32
  %223 = shl nuw nsw i32 %222, 8
  %224 = or i32 %219, %223
  %225 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 39
  %226 = load i8, i8 addrspace(1)* %225, align 1, !tbaa !12
  %227 = zext i8 %226 to i32
  %228 = or i32 %224, %227
  %229 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 9
  store i32 %228, i32 addrspace(5)* %229, align 4, !tbaa !16
  %230 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 40
  %231 = load i8, i8 addrspace(1)* %230, align 1, !tbaa !12
  %232 = zext i8 %231 to i32
  %233 = shl nuw i32 %232, 24
  %234 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 41
  %235 = load i8, i8 addrspace(1)* %234, align 1, !tbaa !12
  %236 = zext i8 %235 to i32
  %237 = shl nuw nsw i32 %236, 16
  %238 = or i32 %237, %233
  %239 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 42
  %240 = load i8, i8 addrspace(1)* %239, align 1, !tbaa !12
  %241 = zext i8 %240 to i32
  %242 = shl nuw nsw i32 %241, 8
  %243 = or i32 %238, %242
  %244 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 43
  %245 = load i8, i8 addrspace(1)* %244, align 1, !tbaa !12
  %246 = zext i8 %245 to i32
  %247 = or i32 %243, %246
  %248 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 10
  store i32 %247, i32 addrspace(5)* %248, align 8, !tbaa !16
  %249 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 44
  %250 = load i8, i8 addrspace(1)* %249, align 1, !tbaa !12
  %251 = zext i8 %250 to i32
  %252 = shl nuw i32 %251, 24
  %253 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 45
  %254 = load i8, i8 addrspace(1)* %253, align 1, !tbaa !12
  %255 = zext i8 %254 to i32
  %256 = shl nuw nsw i32 %255, 16
  %257 = or i32 %256, %252
  %258 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 46
  %259 = load i8, i8 addrspace(1)* %258, align 1, !tbaa !12
  %260 = zext i8 %259 to i32
  %261 = shl nuw nsw i32 %260, 8
  %262 = or i32 %257, %261
  %263 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 47
  %264 = load i8, i8 addrspace(1)* %263, align 1, !tbaa !12
  %265 = zext i8 %264 to i32
  %266 = or i32 %262, %265
  %267 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 11
  store i32 %266, i32 addrspace(5)* %267, align 4, !tbaa !16
  %268 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 48
  %269 = load i8, i8 addrspace(1)* %268, align 1, !tbaa !12
  %270 = zext i8 %269 to i32
  %271 = shl nuw i32 %270, 24
  %272 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 49
  %273 = load i8, i8 addrspace(1)* %272, align 1, !tbaa !12
  %274 = zext i8 %273 to i32
  %275 = shl nuw nsw i32 %274, 16
  %276 = or i32 %275, %271
  %277 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 50
  %278 = load i8, i8 addrspace(1)* %277, align 1, !tbaa !12
  %279 = zext i8 %278 to i32
  %280 = shl nuw nsw i32 %279, 8
  %281 = or i32 %276, %280
  %282 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 51
  %283 = load i8, i8 addrspace(1)* %282, align 1, !tbaa !12
  %284 = zext i8 %283 to i32
  %285 = or i32 %281, %284
  %286 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 12
  store i32 %285, i32 addrspace(5)* %286, align 16, !tbaa !16
  %287 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 52
  %288 = load i8, i8 addrspace(1)* %287, align 1, !tbaa !12
  %289 = zext i8 %288 to i32
  %290 = shl nuw i32 %289, 24
  %291 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 53
  %292 = load i8, i8 addrspace(1)* %291, align 1, !tbaa !12
  %293 = zext i8 %292 to i32
  %294 = shl nuw nsw i32 %293, 16
  %295 = or i32 %294, %290
  %296 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 54
  %297 = load i8, i8 addrspace(1)* %296, align 1, !tbaa !12
  %298 = zext i8 %297 to i32
  %299 = shl nuw nsw i32 %298, 8
  %300 = or i32 %295, %299
  %301 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 55
  %302 = load i8, i8 addrspace(1)* %301, align 1, !tbaa !12
  %303 = zext i8 %302 to i32
  %304 = or i32 %300, %303
  %305 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 13
  store i32 %304, i32 addrspace(5)* %305, align 4, !tbaa !16
  %306 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 56
  %307 = load i8, i8 addrspace(1)* %306, align 1, !tbaa !12
  %308 = zext i8 %307 to i32
  %309 = shl nuw i32 %308, 24
  %310 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 57
  %311 = load i8, i8 addrspace(1)* %310, align 1, !tbaa !12
  %312 = zext i8 %311 to i32
  %313 = shl nuw nsw i32 %312, 16
  %314 = or i32 %313, %309
  %315 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 58
  %316 = load i8, i8 addrspace(1)* %315, align 1, !tbaa !12
  %317 = zext i8 %316 to i32
  %318 = shl nuw nsw i32 %317, 8
  %319 = or i32 %314, %318
  %320 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 59
  %321 = load i8, i8 addrspace(1)* %320, align 1, !tbaa !12
  %322 = zext i8 %321 to i32
  %323 = or i32 %319, %322
  %324 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 14
  store i32 %323, i32 addrspace(5)* %324, align 8, !tbaa !16
  %325 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 60
  %326 = load i8, i8 addrspace(1)* %325, align 1, !tbaa !12
  %327 = zext i8 %326 to i32
  %328 = shl nuw i32 %327, 24
  %329 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 61
  %330 = load i8, i8 addrspace(1)* %329, align 1, !tbaa !12
  %331 = zext i8 %330 to i32
  %332 = shl nuw nsw i32 %331, 16
  %333 = or i32 %332, %328
  %334 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 62
  %335 = load i8, i8 addrspace(1)* %334, align 1, !tbaa !12
  %336 = zext i8 %335 to i32
  %337 = shl nuw nsw i32 %336, 8
  %338 = or i32 %333, %337
  %339 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 63
  %340 = load i8, i8 addrspace(1)* %339, align 1, !tbaa !12
  %341 = zext i8 %340 to i32
  %342 = or i32 %338, %341
  %343 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 15
  store i32 %342, i32 addrspace(5)* %343, align 4, !tbaa !16
  %344 = tail call i32 @llvm.fshl.i32(i32 %323, i32 %314, i32 15)
  %345 = tail call i32 @llvm.fshl.i32(i32 %323, i32 %314, i32 13)
  %346 = lshr i32 %319, 10
  %347 = xor i32 %345, %346
  %348 = xor i32 %347, %344
  %349 = tail call i32 @llvm.fshl.i32(i32 %75, i32 %76, i32 25)
  %350 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %67, i32 14)
  %351 = xor i32 %349, %350
  %352 = lshr i32 %76, 3
  %353 = xor i32 %351, %352
  %354 = add i32 %353, %57
  %355 = add i32 %354, %228
  %356 = add i32 %355, %348
  %357 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 16
  store i32 %356, i32 addrspace(5)* %357, align 16, !tbaa !16
  %358 = tail call i32 @llvm.fshl.i32(i32 %342, i32 %333, i32 15)
  %359 = tail call i32 @llvm.fshl.i32(i32 %342, i32 %333, i32 13)
  %360 = lshr i32 %338, 10
  %361 = xor i32 %359, %360
  %362 = xor i32 %361, %358
  %363 = tail call i32 @llvm.fshl.i32(i32 %94, i32 %95, i32 25)
  %364 = tail call i32 @llvm.fshl.i32(i32 %95, i32 %86, i32 14)
  %365 = xor i32 %363, %364
  %366 = lshr i32 %95, 3
  %367 = xor i32 %365, %366
  %368 = add i32 %367, %76
  %369 = add i32 %368, %247
  %370 = add i32 %369, %362
  %371 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 17
  store i32 %370, i32 addrspace(5)* %371, align 4, !tbaa !16
  %372 = tail call i32 @llvm.fshl.i32(i32 %356, i32 %356, i32 15)
  %373 = tail call i32 @llvm.fshl.i32(i32 %356, i32 %356, i32 13)
  %374 = xor i32 %372, %373
  %375 = lshr i32 %356, 10
  %376 = xor i32 %374, %375
  %377 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %114, i32 25)
  %378 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %105, i32 14)
  %379 = xor i32 %377, %378
  %380 = lshr i32 %114, 3
  %381 = xor i32 %379, %380
  %382 = add i32 %381, %95
  %383 = add i32 %382, %266
  %384 = add i32 %383, %376
  %385 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 18
  store i32 %384, i32 addrspace(5)* %385, align 8, !tbaa !16
  %386 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 15)
  %387 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 13)
  %388 = xor i32 %386, %387
  %389 = lshr i32 %370, 10
  %390 = xor i32 %388, %389
  %391 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %133, i32 25)
  %392 = tail call i32 @llvm.fshl.i32(i32 %133, i32 %124, i32 14)
  %393 = xor i32 %391, %392
  %394 = lshr i32 %133, 3
  %395 = xor i32 %393, %394
  %396 = add i32 %395, %114
  %397 = add i32 %396, %285
  %398 = add i32 %397, %390
  %399 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 19
  store i32 %398, i32 addrspace(5)* %399, align 4, !tbaa !16
  %400 = tail call i32 @llvm.fshl.i32(i32 %384, i32 %384, i32 15)
  %401 = tail call i32 @llvm.fshl.i32(i32 %384, i32 %384, i32 13)
  %402 = xor i32 %400, %401
  %403 = lshr i32 %384, 10
  %404 = xor i32 %402, %403
  %405 = tail call i32 @llvm.fshl.i32(i32 %151, i32 %152, i32 25)
  %406 = tail call i32 @llvm.fshl.i32(i32 %152, i32 %143, i32 14)
  %407 = xor i32 %405, %406
  %408 = lshr i32 %152, 3
  %409 = xor i32 %407, %408
  %410 = add i32 %409, %133
  %411 = add i32 %410, %304
  %412 = add i32 %411, %404
  %413 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 20
  store i32 %412, i32 addrspace(5)* %413, align 16, !tbaa !16
  %414 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 15)
  %415 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 13)
  %416 = xor i32 %414, %415
  %417 = lshr i32 %398, 10
  %418 = xor i32 %416, %417
  %419 = tail call i32 @llvm.fshl.i32(i32 %170, i32 %171, i32 25)
  %420 = tail call i32 @llvm.fshl.i32(i32 %171, i32 %162, i32 14)
  %421 = xor i32 %419, %420
  %422 = lshr i32 %171, 3
  %423 = xor i32 %421, %422
  %424 = add i32 %423, %152
  %425 = add i32 %424, %323
  %426 = add i32 %425, %418
  %427 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 21
  store i32 %426, i32 addrspace(5)* %427, align 4, !tbaa !16
  %428 = tail call i32 @llvm.fshl.i32(i32 %412, i32 %412, i32 15)
  %429 = tail call i32 @llvm.fshl.i32(i32 %412, i32 %412, i32 13)
  %430 = xor i32 %428, %429
  %431 = lshr i32 %412, 10
  %432 = xor i32 %430, %431
  %433 = tail call i32 @llvm.fshl.i32(i32 %189, i32 %190, i32 25)
  %434 = tail call i32 @llvm.fshl.i32(i32 %190, i32 %181, i32 14)
  %435 = xor i32 %433, %434
  %436 = lshr i32 %190, 3
  %437 = xor i32 %435, %436
  %438 = add i32 %437, %171
  %439 = add i32 %438, %342
  %440 = add i32 %439, %432
  %441 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 22
  store i32 %440, i32 addrspace(5)* %441, align 8, !tbaa !16
  %442 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %426, i32 15)
  %443 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %426, i32 13)
  %444 = xor i32 %442, %443
  %445 = lshr i32 %426, 10
  %446 = xor i32 %444, %445
  %447 = tail call i32 @llvm.fshl.i32(i32 %208, i32 %209, i32 25)
  %448 = tail call i32 @llvm.fshl.i32(i32 %209, i32 %200, i32 14)
  %449 = xor i32 %447, %448
  %450 = lshr i32 %209, 3
  %451 = xor i32 %449, %450
  %452 = add i32 %451, %190
  %453 = add i32 %452, %356
  %454 = add i32 %453, %446
  %455 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 23
  store i32 %454, i32 addrspace(5)* %455, align 4, !tbaa !16
  %456 = tail call i32 @llvm.fshl.i32(i32 %440, i32 %440, i32 15)
  %457 = tail call i32 @llvm.fshl.i32(i32 %440, i32 %440, i32 13)
  %458 = xor i32 %456, %457
  %459 = lshr i32 %440, 10
  %460 = xor i32 %458, %459
  %461 = tail call i32 @llvm.fshl.i32(i32 %227, i32 %228, i32 25)
  %462 = tail call i32 @llvm.fshl.i32(i32 %228, i32 %219, i32 14)
  %463 = xor i32 %461, %462
  %464 = lshr i32 %228, 3
  %465 = xor i32 %463, %464
  %466 = add i32 %465, %209
  %467 = add i32 %466, %370
  %468 = add i32 %467, %460
  %469 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 24
  store i32 %468, i32 addrspace(5)* %469, align 16, !tbaa !16
  %470 = tail call i32 @llvm.fshl.i32(i32 %454, i32 %454, i32 15)
  %471 = tail call i32 @llvm.fshl.i32(i32 %454, i32 %454, i32 13)
  %472 = xor i32 %470, %471
  %473 = lshr i32 %454, 10
  %474 = xor i32 %472, %473
  %475 = tail call i32 @llvm.fshl.i32(i32 %246, i32 %247, i32 25)
  %476 = tail call i32 @llvm.fshl.i32(i32 %247, i32 %238, i32 14)
  %477 = xor i32 %475, %476
  %478 = lshr i32 %247, 3
  %479 = xor i32 %477, %478
  %480 = add i32 %479, %228
  %481 = add i32 %480, %384
  %482 = add i32 %481, %474
  %483 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 25
  store i32 %482, i32 addrspace(5)* %483, align 4, !tbaa !16
  %484 = tail call i32 @llvm.fshl.i32(i32 %468, i32 %468, i32 15)
  %485 = tail call i32 @llvm.fshl.i32(i32 %468, i32 %468, i32 13)
  %486 = xor i32 %484, %485
  %487 = lshr i32 %468, 10
  %488 = xor i32 %486, %487
  %489 = tail call i32 @llvm.fshl.i32(i32 %265, i32 %266, i32 25)
  %490 = tail call i32 @llvm.fshl.i32(i32 %266, i32 %257, i32 14)
  %491 = xor i32 %489, %490
  %492 = lshr i32 %266, 3
  %493 = xor i32 %491, %492
  %494 = add i32 %493, %247
  %495 = add i32 %494, %398
  %496 = add i32 %495, %488
  %497 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 26
  store i32 %496, i32 addrspace(5)* %497, align 8, !tbaa !16
  %498 = tail call i32 @llvm.fshl.i32(i32 %482, i32 %482, i32 15)
  %499 = tail call i32 @llvm.fshl.i32(i32 %482, i32 %482, i32 13)
  %500 = xor i32 %498, %499
  %501 = lshr i32 %482, 10
  %502 = xor i32 %500, %501
  %503 = tail call i32 @llvm.fshl.i32(i32 %284, i32 %285, i32 25)
  %504 = tail call i32 @llvm.fshl.i32(i32 %285, i32 %276, i32 14)
  %505 = xor i32 %503, %504
  %506 = lshr i32 %285, 3
  %507 = xor i32 %505, %506
  %508 = add i32 %507, %266
  %509 = add i32 %508, %412
  %510 = add i32 %509, %502
  %511 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 27
  store i32 %510, i32 addrspace(5)* %511, align 4, !tbaa !16
  %512 = tail call i32 @llvm.fshl.i32(i32 %496, i32 %496, i32 15)
  %513 = tail call i32 @llvm.fshl.i32(i32 %496, i32 %496, i32 13)
  %514 = xor i32 %512, %513
  %515 = lshr i32 %496, 10
  %516 = xor i32 %514, %515
  %517 = tail call i32 @llvm.fshl.i32(i32 %303, i32 %304, i32 25)
  %518 = tail call i32 @llvm.fshl.i32(i32 %304, i32 %295, i32 14)
  %519 = xor i32 %517, %518
  %520 = lshr i32 %304, 3
  %521 = xor i32 %519, %520
  %522 = add i32 %521, %285
  %523 = add i32 %522, %426
  %524 = add i32 %523, %516
  %525 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 28
  store i32 %524, i32 addrspace(5)* %525, align 16, !tbaa !16
  %526 = tail call i32 @llvm.fshl.i32(i32 %510, i32 %510, i32 15)
  %527 = tail call i32 @llvm.fshl.i32(i32 %510, i32 %510, i32 13)
  %528 = xor i32 %526, %527
  %529 = lshr i32 %510, 10
  %530 = xor i32 %528, %529
  %531 = tail call i32 @llvm.fshl.i32(i32 %322, i32 %323, i32 25)
  %532 = tail call i32 @llvm.fshl.i32(i32 %323, i32 %314, i32 14)
  %533 = xor i32 %531, %532
  %534 = lshr i32 %323, 3
  %535 = xor i32 %533, %534
  %536 = add i32 %535, %304
  %537 = add i32 %536, %440
  %538 = add i32 %537, %530
  %539 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 29
  store i32 %538, i32 addrspace(5)* %539, align 4, !tbaa !16
  %540 = tail call i32 @llvm.fshl.i32(i32 %524, i32 %524, i32 15)
  %541 = tail call i32 @llvm.fshl.i32(i32 %524, i32 %524, i32 13)
  %542 = xor i32 %540, %541
  %543 = lshr i32 %524, 10
  %544 = xor i32 %542, %543
  %545 = tail call i32 @llvm.fshl.i32(i32 %341, i32 %342, i32 25)
  %546 = tail call i32 @llvm.fshl.i32(i32 %342, i32 %333, i32 14)
  %547 = xor i32 %545, %546
  %548 = lshr i32 %342, 3
  %549 = xor i32 %547, %548
  %550 = add i32 %549, %323
  %551 = add i32 %550, %454
  %552 = add i32 %551, %544
  %553 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 30
  store i32 %552, i32 addrspace(5)* %553, align 8, !tbaa !16
  %554 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 15)
  %555 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 13)
  %556 = xor i32 %554, %555
  %557 = lshr i32 %538, 10
  %558 = xor i32 %556, %557
  %559 = tail call i32 @llvm.fshl.i32(i32 %356, i32 %356, i32 25)
  %560 = tail call i32 @llvm.fshl.i32(i32 %356, i32 %356, i32 14)
  %561 = xor i32 %559, %560
  %562 = lshr i32 %356, 3
  %563 = xor i32 %561, %562
  %564 = add i32 %563, %342
  %565 = add i32 %564, %468
  %566 = add i32 %565, %558
  %567 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 31
  store i32 %566, i32 addrspace(5)* %567, align 4, !tbaa !16
  %568 = tail call i32 @llvm.fshl.i32(i32 %552, i32 %552, i32 15)
  %569 = tail call i32 @llvm.fshl.i32(i32 %552, i32 %552, i32 13)
  %570 = xor i32 %568, %569
  %571 = lshr i32 %552, 10
  %572 = xor i32 %570, %571
  %573 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 25)
  %574 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 14)
  %575 = xor i32 %573, %574
  %576 = lshr i32 %370, 3
  %577 = xor i32 %575, %576
  %578 = add i32 %577, %356
  %579 = add i32 %578, %482
  %580 = add i32 %579, %572
  %581 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 32
  store i32 %580, i32 addrspace(5)* %581, align 16, !tbaa !16
  %582 = tail call i32 @llvm.fshl.i32(i32 %566, i32 %566, i32 15)
  %583 = tail call i32 @llvm.fshl.i32(i32 %566, i32 %566, i32 13)
  %584 = xor i32 %582, %583
  %585 = lshr i32 %566, 10
  %586 = xor i32 %584, %585
  %587 = tail call i32 @llvm.fshl.i32(i32 %384, i32 %384, i32 25)
  %588 = tail call i32 @llvm.fshl.i32(i32 %384, i32 %384, i32 14)
  %589 = xor i32 %587, %588
  %590 = lshr i32 %384, 3
  %591 = xor i32 %589, %590
  %592 = add i32 %591, %370
  %593 = add i32 %592, %496
  %594 = add i32 %593, %586
  %595 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 33
  store i32 %594, i32 addrspace(5)* %595, align 4, !tbaa !16
  %596 = tail call i32 @llvm.fshl.i32(i32 %580, i32 %580, i32 15)
  %597 = tail call i32 @llvm.fshl.i32(i32 %580, i32 %580, i32 13)
  %598 = xor i32 %596, %597
  %599 = lshr i32 %580, 10
  %600 = xor i32 %598, %599
  %601 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 25)
  %602 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 14)
  %603 = xor i32 %601, %602
  %604 = lshr i32 %398, 3
  %605 = xor i32 %603, %604
  %606 = add i32 %605, %384
  %607 = add i32 %606, %510
  %608 = add i32 %607, %600
  %609 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 34
  store i32 %608, i32 addrspace(5)* %609, align 8, !tbaa !16
  %610 = tail call i32 @llvm.fshl.i32(i32 %594, i32 %594, i32 15)
  %611 = tail call i32 @llvm.fshl.i32(i32 %594, i32 %594, i32 13)
  %612 = xor i32 %610, %611
  %613 = lshr i32 %594, 10
  %614 = xor i32 %612, %613
  %615 = tail call i32 @llvm.fshl.i32(i32 %412, i32 %412, i32 25)
  %616 = tail call i32 @llvm.fshl.i32(i32 %412, i32 %412, i32 14)
  %617 = xor i32 %615, %616
  %618 = lshr i32 %412, 3
  %619 = xor i32 %617, %618
  %620 = add i32 %619, %398
  %621 = add i32 %620, %524
  %622 = add i32 %621, %614
  %623 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 35
  store i32 %622, i32 addrspace(5)* %623, align 4, !tbaa !16
  %624 = tail call i32 @llvm.fshl.i32(i32 %608, i32 %608, i32 15)
  %625 = tail call i32 @llvm.fshl.i32(i32 %608, i32 %608, i32 13)
  %626 = xor i32 %624, %625
  %627 = lshr i32 %608, 10
  %628 = xor i32 %626, %627
  %629 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %426, i32 25)
  %630 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %426, i32 14)
  %631 = xor i32 %629, %630
  %632 = lshr i32 %426, 3
  %633 = xor i32 %631, %632
  %634 = add i32 %633, %412
  %635 = add i32 %634, %538
  %636 = add i32 %635, %628
  %637 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 36
  store i32 %636, i32 addrspace(5)* %637, align 16, !tbaa !16
  %638 = tail call i32 @llvm.fshl.i32(i32 %622, i32 %622, i32 15)
  %639 = tail call i32 @llvm.fshl.i32(i32 %622, i32 %622, i32 13)
  %640 = xor i32 %638, %639
  %641 = lshr i32 %622, 10
  %642 = xor i32 %640, %641
  %643 = tail call i32 @llvm.fshl.i32(i32 %440, i32 %440, i32 25)
  %644 = tail call i32 @llvm.fshl.i32(i32 %440, i32 %440, i32 14)
  %645 = xor i32 %643, %644
  %646 = lshr i32 %440, 3
  %647 = xor i32 %645, %646
  %648 = add i32 %647, %426
  %649 = add i32 %648, %552
  %650 = add i32 %649, %642
  %651 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 37
  store i32 %650, i32 addrspace(5)* %651, align 4, !tbaa !16
  %652 = tail call i32 @llvm.fshl.i32(i32 %636, i32 %636, i32 15)
  %653 = tail call i32 @llvm.fshl.i32(i32 %636, i32 %636, i32 13)
  %654 = xor i32 %652, %653
  %655 = lshr i32 %636, 10
  %656 = xor i32 %654, %655
  %657 = tail call i32 @llvm.fshl.i32(i32 %454, i32 %454, i32 25)
  %658 = tail call i32 @llvm.fshl.i32(i32 %454, i32 %454, i32 14)
  %659 = xor i32 %657, %658
  %660 = lshr i32 %454, 3
  %661 = xor i32 %659, %660
  %662 = add i32 %661, %440
  %663 = add i32 %662, %566
  %664 = add i32 %663, %656
  %665 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 38
  store i32 %664, i32 addrspace(5)* %665, align 8, !tbaa !16
  %666 = tail call i32 @llvm.fshl.i32(i32 %650, i32 %650, i32 15)
  %667 = tail call i32 @llvm.fshl.i32(i32 %650, i32 %650, i32 13)
  %668 = xor i32 %666, %667
  %669 = lshr i32 %650, 10
  %670 = xor i32 %668, %669
  %671 = tail call i32 @llvm.fshl.i32(i32 %468, i32 %468, i32 25)
  %672 = tail call i32 @llvm.fshl.i32(i32 %468, i32 %468, i32 14)
  %673 = xor i32 %671, %672
  %674 = lshr i32 %468, 3
  %675 = xor i32 %673, %674
  %676 = add i32 %675, %454
  %677 = add i32 %676, %580
  %678 = add i32 %677, %670
  %679 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 39
  store i32 %678, i32 addrspace(5)* %679, align 4, !tbaa !16
  %680 = tail call i32 @llvm.fshl.i32(i32 %664, i32 %664, i32 15)
  %681 = tail call i32 @llvm.fshl.i32(i32 %664, i32 %664, i32 13)
  %682 = xor i32 %680, %681
  %683 = lshr i32 %664, 10
  %684 = xor i32 %682, %683
  %685 = tail call i32 @llvm.fshl.i32(i32 %482, i32 %482, i32 25)
  %686 = tail call i32 @llvm.fshl.i32(i32 %482, i32 %482, i32 14)
  %687 = xor i32 %685, %686
  %688 = lshr i32 %482, 3
  %689 = xor i32 %687, %688
  %690 = add i32 %689, %468
  %691 = add i32 %690, %594
  %692 = add i32 %691, %684
  %693 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 40
  store i32 %692, i32 addrspace(5)* %693, align 16, !tbaa !16
  %694 = tail call i32 @llvm.fshl.i32(i32 %678, i32 %678, i32 15)
  %695 = tail call i32 @llvm.fshl.i32(i32 %678, i32 %678, i32 13)
  %696 = xor i32 %694, %695
  %697 = lshr i32 %678, 10
  %698 = xor i32 %696, %697
  %699 = tail call i32 @llvm.fshl.i32(i32 %496, i32 %496, i32 25)
  %700 = tail call i32 @llvm.fshl.i32(i32 %496, i32 %496, i32 14)
  %701 = xor i32 %699, %700
  %702 = lshr i32 %496, 3
  %703 = xor i32 %701, %702
  %704 = add i32 %703, %482
  %705 = add i32 %704, %608
  %706 = add i32 %705, %698
  %707 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 41
  store i32 %706, i32 addrspace(5)* %707, align 4, !tbaa !16
  %708 = tail call i32 @llvm.fshl.i32(i32 %692, i32 %692, i32 15)
  %709 = tail call i32 @llvm.fshl.i32(i32 %692, i32 %692, i32 13)
  %710 = xor i32 %708, %709
  %711 = lshr i32 %692, 10
  %712 = xor i32 %710, %711
  %713 = tail call i32 @llvm.fshl.i32(i32 %510, i32 %510, i32 25)
  %714 = tail call i32 @llvm.fshl.i32(i32 %510, i32 %510, i32 14)
  %715 = xor i32 %713, %714
  %716 = lshr i32 %510, 3
  %717 = xor i32 %715, %716
  %718 = add i32 %717, %496
  %719 = add i32 %718, %622
  %720 = add i32 %719, %712
  %721 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 42
  store i32 %720, i32 addrspace(5)* %721, align 8, !tbaa !16
  %722 = tail call i32 @llvm.fshl.i32(i32 %706, i32 %706, i32 15)
  %723 = tail call i32 @llvm.fshl.i32(i32 %706, i32 %706, i32 13)
  %724 = xor i32 %722, %723
  %725 = lshr i32 %706, 10
  %726 = xor i32 %724, %725
  %727 = tail call i32 @llvm.fshl.i32(i32 %524, i32 %524, i32 25)
  %728 = tail call i32 @llvm.fshl.i32(i32 %524, i32 %524, i32 14)
  %729 = xor i32 %727, %728
  %730 = lshr i32 %524, 3
  %731 = xor i32 %729, %730
  %732 = add i32 %731, %510
  %733 = add i32 %732, %636
  %734 = add i32 %733, %726
  %735 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 43
  store i32 %734, i32 addrspace(5)* %735, align 4, !tbaa !16
  %736 = tail call i32 @llvm.fshl.i32(i32 %720, i32 %720, i32 15)
  %737 = tail call i32 @llvm.fshl.i32(i32 %720, i32 %720, i32 13)
  %738 = xor i32 %736, %737
  %739 = lshr i32 %720, 10
  %740 = xor i32 %738, %739
  %741 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 25)
  %742 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 14)
  %743 = xor i32 %741, %742
  %744 = lshr i32 %538, 3
  %745 = xor i32 %743, %744
  %746 = add i32 %745, %524
  %747 = add i32 %746, %650
  %748 = add i32 %747, %740
  %749 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 44
  store i32 %748, i32 addrspace(5)* %749, align 16, !tbaa !16
  %750 = tail call i32 @llvm.fshl.i32(i32 %734, i32 %734, i32 15)
  %751 = tail call i32 @llvm.fshl.i32(i32 %734, i32 %734, i32 13)
  %752 = xor i32 %750, %751
  %753 = lshr i32 %734, 10
  %754 = xor i32 %752, %753
  %755 = tail call i32 @llvm.fshl.i32(i32 %552, i32 %552, i32 25)
  %756 = tail call i32 @llvm.fshl.i32(i32 %552, i32 %552, i32 14)
  %757 = xor i32 %755, %756
  %758 = lshr i32 %552, 3
  %759 = xor i32 %757, %758
  %760 = add i32 %759, %538
  %761 = add i32 %760, %664
  %762 = add i32 %761, %754
  %763 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 45
  store i32 %762, i32 addrspace(5)* %763, align 4, !tbaa !16
  %764 = tail call i32 @llvm.fshl.i32(i32 %748, i32 %748, i32 15)
  %765 = tail call i32 @llvm.fshl.i32(i32 %748, i32 %748, i32 13)
  %766 = xor i32 %764, %765
  %767 = lshr i32 %748, 10
  %768 = xor i32 %766, %767
  %769 = tail call i32 @llvm.fshl.i32(i32 %566, i32 %566, i32 25)
  %770 = tail call i32 @llvm.fshl.i32(i32 %566, i32 %566, i32 14)
  %771 = xor i32 %769, %770
  %772 = lshr i32 %566, 3
  %773 = xor i32 %771, %772
  %774 = add i32 %773, %552
  %775 = add i32 %774, %678
  %776 = add i32 %775, %768
  %777 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 46
  store i32 %776, i32 addrspace(5)* %777, align 8, !tbaa !16
  %778 = tail call i32 @llvm.fshl.i32(i32 %762, i32 %762, i32 15)
  %779 = tail call i32 @llvm.fshl.i32(i32 %762, i32 %762, i32 13)
  %780 = xor i32 %778, %779
  %781 = lshr i32 %762, 10
  %782 = xor i32 %780, %781
  %783 = tail call i32 @llvm.fshl.i32(i32 %580, i32 %580, i32 25)
  %784 = tail call i32 @llvm.fshl.i32(i32 %580, i32 %580, i32 14)
  %785 = xor i32 %783, %784
  %786 = lshr i32 %580, 3
  %787 = xor i32 %785, %786
  %788 = add i32 %787, %566
  %789 = add i32 %788, %692
  %790 = add i32 %789, %782
  %791 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 47
  store i32 %790, i32 addrspace(5)* %791, align 4, !tbaa !16
  %792 = tail call i32 @llvm.fshl.i32(i32 %776, i32 %776, i32 15)
  %793 = tail call i32 @llvm.fshl.i32(i32 %776, i32 %776, i32 13)
  %794 = xor i32 %792, %793
  %795 = lshr i32 %776, 10
  %796 = xor i32 %794, %795
  %797 = tail call i32 @llvm.fshl.i32(i32 %594, i32 %594, i32 25)
  %798 = tail call i32 @llvm.fshl.i32(i32 %594, i32 %594, i32 14)
  %799 = xor i32 %797, %798
  %800 = lshr i32 %594, 3
  %801 = xor i32 %799, %800
  %802 = add i32 %801, %580
  %803 = add i32 %802, %706
  %804 = add i32 %803, %796
  %805 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 48
  store i32 %804, i32 addrspace(5)* %805, align 16, !tbaa !16
  %806 = tail call i32 @llvm.fshl.i32(i32 %790, i32 %790, i32 15)
  %807 = tail call i32 @llvm.fshl.i32(i32 %790, i32 %790, i32 13)
  %808 = xor i32 %806, %807
  %809 = lshr i32 %790, 10
  %810 = xor i32 %808, %809
  %811 = tail call i32 @llvm.fshl.i32(i32 %608, i32 %608, i32 25)
  %812 = tail call i32 @llvm.fshl.i32(i32 %608, i32 %608, i32 14)
  %813 = xor i32 %811, %812
  %814 = lshr i32 %608, 3
  %815 = xor i32 %813, %814
  %816 = add i32 %815, %594
  %817 = add i32 %816, %720
  %818 = add i32 %817, %810
  %819 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 49
  store i32 %818, i32 addrspace(5)* %819, align 4, !tbaa !16
  %820 = tail call i32 @llvm.fshl.i32(i32 %804, i32 %804, i32 15)
  %821 = tail call i32 @llvm.fshl.i32(i32 %804, i32 %804, i32 13)
  %822 = xor i32 %820, %821
  %823 = lshr i32 %804, 10
  %824 = xor i32 %822, %823
  %825 = tail call i32 @llvm.fshl.i32(i32 %622, i32 %622, i32 25)
  %826 = tail call i32 @llvm.fshl.i32(i32 %622, i32 %622, i32 14)
  %827 = xor i32 %825, %826
  %828 = lshr i32 %622, 3
  %829 = xor i32 %827, %828
  %830 = add i32 %829, %608
  %831 = add i32 %830, %734
  %832 = add i32 %831, %824
  %833 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 50
  store i32 %832, i32 addrspace(5)* %833, align 8, !tbaa !16
  %834 = tail call i32 @llvm.fshl.i32(i32 %818, i32 %818, i32 15)
  %835 = tail call i32 @llvm.fshl.i32(i32 %818, i32 %818, i32 13)
  %836 = xor i32 %834, %835
  %837 = lshr i32 %818, 10
  %838 = xor i32 %836, %837
  %839 = tail call i32 @llvm.fshl.i32(i32 %636, i32 %636, i32 25)
  %840 = tail call i32 @llvm.fshl.i32(i32 %636, i32 %636, i32 14)
  %841 = xor i32 %839, %840
  %842 = lshr i32 %636, 3
  %843 = xor i32 %841, %842
  %844 = add i32 %843, %622
  %845 = add i32 %844, %748
  %846 = add i32 %845, %838
  %847 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 51
  store i32 %846, i32 addrspace(5)* %847, align 4, !tbaa !16
  %848 = tail call i32 @llvm.fshl.i32(i32 %832, i32 %832, i32 15)
  %849 = tail call i32 @llvm.fshl.i32(i32 %832, i32 %832, i32 13)
  %850 = xor i32 %848, %849
  %851 = lshr i32 %832, 10
  %852 = xor i32 %850, %851
  %853 = tail call i32 @llvm.fshl.i32(i32 %650, i32 %650, i32 25)
  %854 = tail call i32 @llvm.fshl.i32(i32 %650, i32 %650, i32 14)
  %855 = xor i32 %853, %854
  %856 = lshr i32 %650, 3
  %857 = xor i32 %855, %856
  %858 = add i32 %857, %636
  %859 = add i32 %858, %762
  %860 = add i32 %859, %852
  %861 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 52
  store i32 %860, i32 addrspace(5)* %861, align 16, !tbaa !16
  %862 = tail call i32 @llvm.fshl.i32(i32 %846, i32 %846, i32 15)
  %863 = tail call i32 @llvm.fshl.i32(i32 %846, i32 %846, i32 13)
  %864 = xor i32 %862, %863
  %865 = lshr i32 %846, 10
  %866 = xor i32 %864, %865
  %867 = tail call i32 @llvm.fshl.i32(i32 %664, i32 %664, i32 25)
  %868 = tail call i32 @llvm.fshl.i32(i32 %664, i32 %664, i32 14)
  %869 = xor i32 %867, %868
  %870 = lshr i32 %664, 3
  %871 = xor i32 %869, %870
  %872 = add i32 %871, %650
  %873 = add i32 %872, %776
  %874 = add i32 %873, %866
  %875 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 53
  store i32 %874, i32 addrspace(5)* %875, align 4, !tbaa !16
  %876 = tail call i32 @llvm.fshl.i32(i32 %860, i32 %860, i32 15)
  %877 = tail call i32 @llvm.fshl.i32(i32 %860, i32 %860, i32 13)
  %878 = xor i32 %876, %877
  %879 = lshr i32 %860, 10
  %880 = xor i32 %878, %879
  %881 = tail call i32 @llvm.fshl.i32(i32 %678, i32 %678, i32 25)
  %882 = tail call i32 @llvm.fshl.i32(i32 %678, i32 %678, i32 14)
  %883 = xor i32 %881, %882
  %884 = lshr i32 %678, 3
  %885 = xor i32 %883, %884
  %886 = add i32 %885, %664
  %887 = add i32 %886, %790
  %888 = add i32 %887, %880
  %889 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 54
  store i32 %888, i32 addrspace(5)* %889, align 8, !tbaa !16
  %890 = tail call i32 @llvm.fshl.i32(i32 %874, i32 %874, i32 15)
  %891 = tail call i32 @llvm.fshl.i32(i32 %874, i32 %874, i32 13)
  %892 = xor i32 %890, %891
  %893 = lshr i32 %874, 10
  %894 = xor i32 %892, %893
  %895 = tail call i32 @llvm.fshl.i32(i32 %692, i32 %692, i32 25)
  %896 = tail call i32 @llvm.fshl.i32(i32 %692, i32 %692, i32 14)
  %897 = xor i32 %895, %896
  %898 = lshr i32 %692, 3
  %899 = xor i32 %897, %898
  %900 = add i32 %899, %678
  %901 = add i32 %900, %804
  %902 = add i32 %901, %894
  %903 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 55
  store i32 %902, i32 addrspace(5)* %903, align 4, !tbaa !16
  %904 = tail call i32 @llvm.fshl.i32(i32 %888, i32 %888, i32 15)
  %905 = tail call i32 @llvm.fshl.i32(i32 %888, i32 %888, i32 13)
  %906 = xor i32 %904, %905
  %907 = lshr i32 %888, 10
  %908 = xor i32 %906, %907
  %909 = tail call i32 @llvm.fshl.i32(i32 %706, i32 %706, i32 25)
  %910 = tail call i32 @llvm.fshl.i32(i32 %706, i32 %706, i32 14)
  %911 = xor i32 %909, %910
  %912 = lshr i32 %706, 3
  %913 = xor i32 %911, %912
  %914 = add i32 %913, %692
  %915 = add i32 %914, %818
  %916 = add i32 %915, %908
  %917 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 56
  store i32 %916, i32 addrspace(5)* %917, align 16, !tbaa !16
  %918 = tail call i32 @llvm.fshl.i32(i32 %902, i32 %902, i32 15)
  %919 = tail call i32 @llvm.fshl.i32(i32 %902, i32 %902, i32 13)
  %920 = xor i32 %918, %919
  %921 = lshr i32 %902, 10
  %922 = xor i32 %920, %921
  %923 = tail call i32 @llvm.fshl.i32(i32 %720, i32 %720, i32 25)
  %924 = tail call i32 @llvm.fshl.i32(i32 %720, i32 %720, i32 14)
  %925 = xor i32 %923, %924
  %926 = lshr i32 %720, 3
  %927 = xor i32 %925, %926
  %928 = add i32 %927, %706
  %929 = add i32 %928, %832
  %930 = add i32 %929, %922
  %931 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 57
  store i32 %930, i32 addrspace(5)* %931, align 4, !tbaa !16
  %932 = tail call i32 @llvm.fshl.i32(i32 %916, i32 %916, i32 15)
  %933 = tail call i32 @llvm.fshl.i32(i32 %916, i32 %916, i32 13)
  %934 = xor i32 %932, %933
  %935 = lshr i32 %916, 10
  %936 = xor i32 %934, %935
  %937 = tail call i32 @llvm.fshl.i32(i32 %734, i32 %734, i32 25)
  %938 = tail call i32 @llvm.fshl.i32(i32 %734, i32 %734, i32 14)
  %939 = xor i32 %937, %938
  %940 = lshr i32 %734, 3
  %941 = xor i32 %939, %940
  %942 = add i32 %941, %720
  %943 = add i32 %942, %846
  %944 = add i32 %943, %936
  %945 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 58
  store i32 %944, i32 addrspace(5)* %945, align 8, !tbaa !16
  %946 = tail call i32 @llvm.fshl.i32(i32 %930, i32 %930, i32 15)
  %947 = tail call i32 @llvm.fshl.i32(i32 %930, i32 %930, i32 13)
  %948 = xor i32 %946, %947
  %949 = lshr i32 %930, 10
  %950 = xor i32 %948, %949
  %951 = tail call i32 @llvm.fshl.i32(i32 %748, i32 %748, i32 25)
  %952 = tail call i32 @llvm.fshl.i32(i32 %748, i32 %748, i32 14)
  %953 = xor i32 %951, %952
  %954 = lshr i32 %748, 3
  %955 = xor i32 %953, %954
  %956 = add i32 %955, %734
  %957 = add i32 %956, %860
  %958 = add i32 %957, %950
  %959 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 59
  store i32 %958, i32 addrspace(5)* %959, align 4, !tbaa !16
  %960 = tail call i32 @llvm.fshl.i32(i32 %944, i32 %944, i32 15)
  %961 = tail call i32 @llvm.fshl.i32(i32 %944, i32 %944, i32 13)
  %962 = xor i32 %960, %961
  %963 = lshr i32 %944, 10
  %964 = xor i32 %962, %963
  %965 = tail call i32 @llvm.fshl.i32(i32 %762, i32 %762, i32 25)
  %966 = tail call i32 @llvm.fshl.i32(i32 %762, i32 %762, i32 14)
  %967 = xor i32 %965, %966
  %968 = lshr i32 %762, 3
  %969 = xor i32 %967, %968
  %970 = add i32 %969, %748
  %971 = add i32 %970, %874
  %972 = add i32 %971, %964
  %973 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 60
  store i32 %972, i32 addrspace(5)* %973, align 16, !tbaa !16
  %974 = tail call i32 @llvm.fshl.i32(i32 %958, i32 %958, i32 15)
  %975 = tail call i32 @llvm.fshl.i32(i32 %958, i32 %958, i32 13)
  %976 = xor i32 %974, %975
  %977 = lshr i32 %958, 10
  %978 = xor i32 %976, %977
  %979 = tail call i32 @llvm.fshl.i32(i32 %776, i32 %776, i32 25)
  %980 = tail call i32 @llvm.fshl.i32(i32 %776, i32 %776, i32 14)
  %981 = xor i32 %979, %980
  %982 = lshr i32 %776, 3
  %983 = xor i32 %981, %982
  %984 = add i32 %983, %762
  %985 = add i32 %984, %888
  %986 = add i32 %985, %978
  %987 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 61
  store i32 %986, i32 addrspace(5)* %987, align 4, !tbaa !16
  %988 = tail call i32 @llvm.fshl.i32(i32 %972, i32 %972, i32 15)
  %989 = tail call i32 @llvm.fshl.i32(i32 %972, i32 %972, i32 13)
  %990 = xor i32 %988, %989
  %991 = lshr i32 %972, 10
  %992 = xor i32 %990, %991
  %993 = tail call i32 @llvm.fshl.i32(i32 %790, i32 %790, i32 25)
  %994 = tail call i32 @llvm.fshl.i32(i32 %790, i32 %790, i32 14)
  %995 = xor i32 %993, %994
  %996 = lshr i32 %790, 3
  %997 = xor i32 %995, %996
  %998 = add i32 %997, %776
  %999 = add i32 %998, %902
  %1000 = add i32 %999, %992
  %1001 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 62
  store i32 %1000, i32 addrspace(5)* %1001, align 8, !tbaa !16
  %1002 = tail call i32 @llvm.fshl.i32(i32 %986, i32 %986, i32 15)
  %1003 = tail call i32 @llvm.fshl.i32(i32 %986, i32 %986, i32 13)
  %1004 = xor i32 %1002, %1003
  %1005 = lshr i32 %986, 10
  %1006 = xor i32 %1004, %1005
  %1007 = tail call i32 @llvm.fshl.i32(i32 %804, i32 %804, i32 25)
  %1008 = tail call i32 @llvm.fshl.i32(i32 %804, i32 %804, i32 14)
  %1009 = xor i32 %1007, %1008
  %1010 = lshr i32 %804, 3
  %1011 = xor i32 %1009, %1010
  %1012 = add i32 %1011, %790
  %1013 = add i32 %1012, %916
  %1014 = add i32 %1013, %1006
  %1015 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 63
  store i32 %1014, i32 addrspace(5)* %1015, align 4, !tbaa !16
  %1016 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 0
  %1017 = load i32, i32 addrspace(1)* %1016, align 4, !tbaa !16
  %1018 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 1
  %1019 = load i32, i32 addrspace(1)* %1018, align 4, !tbaa !16
  %1020 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 2
  %1021 = load i32, i32 addrspace(1)* %1020, align 4, !tbaa !16
  %1022 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 3
  %1023 = load i32, i32 addrspace(1)* %1022, align 4, !tbaa !16
  %1024 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 4
  %1025 = load i32, i32 addrspace(1)* %1024, align 4, !tbaa !16
  %1026 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 5
  %1027 = load i32, i32 addrspace(1)* %1026, align 4, !tbaa !16
  %1028 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 6
  %1029 = load i32, i32 addrspace(1)* %1028, align 4, !tbaa !16
  %1030 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 7
  %1031 = load i32, i32 addrspace(1)* %1030, align 4, !tbaa !16
  br label %1032

1032:                                             ; preds = %1032, %38
  %1033 = phi i32 [ %1017, %38 ], [ %1102, %1032 ]
  %1034 = phi i32 [ %1019, %38 ], [ %1071, %1032 ]
  %1035 = phi i32 [ 0, %38 ], [ %1103, %1032 ]
  %1036 = phi i32 [ %1031, %38 ], [ %1038, %1032 ]
  %1037 = phi i32 [ %1029, %38 ], [ %1039, %1032 ]
  %1038 = phi i32 [ %1027, %38 ], [ %1070, %1032 ]
  %1039 = phi i32 [ %1025, %38 ], [ %1101, %1032 ]
  %1040 = phi i32 [ %1023, %38 ], [ %1034, %1032 ]
  %1041 = phi i32 [ %1021, %38 ], [ %1033, %1032 ]
  %1042 = tail call i32 @llvm.fshl.i32(i32 %1039, i32 %1039, i32 26)
  %1043 = tail call i32 @llvm.fshl.i32(i32 %1039, i32 %1039, i32 21)
  %1044 = xor i32 %1042, %1043
  %1045 = tail call i32 @llvm.fshl.i32(i32 %1039, i32 %1039, i32 7)
  %1046 = xor i32 %1044, %1045
  %1047 = and i32 %1039, %1038
  %1048 = xor i32 %1039, -1
  %1049 = and i32 %1037, %1048
  %1050 = zext i32 %1035 to i64
  %1051 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(1)* @k, i64 0, i64 %1050
  %1052 = load i32, i32 addrspace(1)* %1051, align 8, !tbaa !16
  %1053 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 %1035
  %1054 = load i32, i32 addrspace(5)* %1053, align 8, !tbaa !16
  %1055 = add i32 %1047, %1036
  %1056 = add i32 %1055, %1049
  %1057 = add i32 %1056, %1046
  %1058 = add i32 %1057, %1052
  %1059 = add i32 %1058, %1054
  %1060 = tail call i32 @llvm.fshl.i32(i32 %1033, i32 %1033, i32 30)
  %1061 = tail call i32 @llvm.fshl.i32(i32 %1033, i32 %1033, i32 19)
  %1062 = xor i32 %1060, %1061
  %1063 = tail call i32 @llvm.fshl.i32(i32 %1033, i32 %1033, i32 10)
  %1064 = xor i32 %1062, %1063
  %1065 = xor i32 %1041, %1034
  %1066 = and i32 %1065, %1033
  %1067 = and i32 %1041, %1034
  %1068 = xor i32 %1066, %1067
  %1069 = add i32 %1068, %1064
  %1070 = add i32 %1059, %1040
  %1071 = add i32 %1069, %1059
  %1072 = or i32 %1035, 1
  %1073 = tail call i32 @llvm.fshl.i32(i32 %1070, i32 %1070, i32 26)
  %1074 = tail call i32 @llvm.fshl.i32(i32 %1070, i32 %1070, i32 21)
  %1075 = xor i32 %1073, %1074
  %1076 = tail call i32 @llvm.fshl.i32(i32 %1070, i32 %1070, i32 7)
  %1077 = xor i32 %1075, %1076
  %1078 = and i32 %1070, %1039
  %1079 = xor i32 %1070, -1
  %1080 = and i32 %1038, %1079
  %1081 = zext i32 %1072 to i64
  %1082 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(1)* @k, i64 0, i64 %1081
  %1083 = load i32, i32 addrspace(1)* %1082, align 4, !tbaa !16
  %1084 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %4, i32 0, i32 %1072
  %1085 = load i32, i32 addrspace(5)* %1084, align 4, !tbaa !16
  %1086 = add i32 %1078, %1037
  %1087 = add i32 %1086, %1080
  %1088 = add i32 %1087, %1077
  %1089 = add i32 %1088, %1083
  %1090 = add i32 %1089, %1085
  %1091 = tail call i32 @llvm.fshl.i32(i32 %1071, i32 %1071, i32 30)
  %1092 = tail call i32 @llvm.fshl.i32(i32 %1071, i32 %1071, i32 19)
  %1093 = xor i32 %1091, %1092
  %1094 = tail call i32 @llvm.fshl.i32(i32 %1071, i32 %1071, i32 10)
  %1095 = xor i32 %1093, %1094
  %1096 = xor i32 %1034, %1033
  %1097 = and i32 %1096, %1071
  %1098 = and i32 %1034, %1033
  %1099 = xor i32 %1097, %1098
  %1100 = add i32 %1099, %1095
  %1101 = add i32 %1090, %1041
  %1102 = add i32 %1100, %1090
  %1103 = add nuw nsw i32 %1035, 2
  %1104 = icmp eq i32 %1103, 64
  br i1 %1104, label %1105, label %1032, !llvm.loop !17

1105:                                             ; preds = %1032
  %1106 = add i32 %1102, %1017
  store i32 %1106, i32 addrspace(1)* %1016, align 4, !tbaa !16
  %1107 = add i32 %1071, %1019
  store i32 %1107, i32 addrspace(1)* %1018, align 4, !tbaa !16
  %1108 = add i32 %1033, %1021
  store i32 %1108, i32 addrspace(1)* %1020, align 4, !tbaa !16
  %1109 = add i32 %1034, %1023
  store i32 %1109, i32 addrspace(1)* %1022, align 4, !tbaa !16
  %1110 = add i32 %1101, %1025
  store i32 %1110, i32 addrspace(1)* %1024, align 4, !tbaa !16
  %1111 = add i32 %1070, %1027
  store i32 %1111, i32 addrspace(1)* %1026, align 4, !tbaa !16
  %1112 = add i32 %1039, %1029
  store i32 %1112, i32 addrspace(1)* %1028, align 4, !tbaa !16
  %1113 = add i32 %1038, %1031
  store i32 %1113, i32 addrspace(1)* %1030, align 4, !tbaa !16
  call void @llvm.lifetime.end.p5i8(i64 256, i8 addrspace(5)* %40) #4
  store i8 0, i8 addrspace(1)* %39, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %44, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %49, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %54, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %59, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %63, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %68, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %73, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %78, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %82, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %87, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %92, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %97, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %101, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %106, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %111, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %116, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %120, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %125, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %130, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %135, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %139, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %144, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %149, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %154, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %158, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %163, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %168, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %173, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %177, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %182, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %187, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %192, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %196, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %201, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %206, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %211, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %215, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %220, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %225, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %230, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %234, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %239, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %244, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %249, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %253, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %258, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %263, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %268, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %272, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %277, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %282, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %287, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %291, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %296, align 1, !tbaa !12
  store i8 0, i8 addrspace(1)* %301, align 1, !tbaa !12
  br label %1114

1114:                                             ; preds = %24, %22, %1105
  %1115 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 2, i64 0
  %1116 = load i32, i32 addrspace(1)* %1115, align 4, !tbaa !16
  %1117 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %1118 = shl i32 %1117, 3
  %1119 = xor i32 %1118, -1
  %1120 = icmp ugt i32 %1116, %1119
  %1121 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 2, i64 1
  %1122 = load i32, i32 addrspace(1)* %1121, align 4, !tbaa !16
  br i1 %1120, label %1123, label %1125

1123:                                             ; preds = %1114
  %1124 = add i32 %1122, 1
  store i32 %1124, i32 addrspace(1)* %1121, align 4, !tbaa !16
  br label %1125

1125:                                             ; preds = %1114, %1123
  %1126 = phi i32 [ %1124, %1123 ], [ %1122, %1114 ]
  %1127 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 63
  %1128 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 62
  %1129 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 61
  %1130 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 60
  %1131 = add i32 %1116, %1118
  store i32 %1131, i32 addrspace(1)* %1115, align 4, !tbaa !16
  %1132 = lshr i32 %1131, 8
  %1133 = lshr i32 %1131, 16
  %1134 = lshr i32 %1131, 24
  %1135 = insertelement <4 x i32> poison, i32 %1134, i64 0
  %1136 = insertelement <4 x i32> %1135, i32 %1133, i64 1
  %1137 = insertelement <4 x i32> %1136, i32 %1132, i64 2
  %1138 = insertelement <4 x i32> %1137, i32 %1131, i64 3
  %1139 = trunc <4 x i32> %1138 to <4 x i8>
  %1140 = bitcast i8 addrspace(1)* %1130 to <4 x i8> addrspace(1)*
  store <4 x i8> %1139, <4 x i8> addrspace(1)* %1140, align 4, !tbaa !12
  %1141 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 59
  %1142 = lshr i32 %1126, 8
  %1143 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 58
  %1144 = lshr i32 %1126, 16
  %1145 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 57
  %1146 = lshr i32 %1126, 24
  %1147 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 56
  %1148 = insertelement <4 x i32> poison, i32 %1146, i64 0
  %1149 = insertelement <4 x i32> %1148, i32 %1144, i64 1
  %1150 = insertelement <4 x i32> %1149, i32 %1142, i64 2
  %1151 = insertelement <4 x i32> %1150, i32 %1126, i64 3
  %1152 = trunc <4 x i32> %1151 to <4 x i8>
  %1153 = bitcast i8 addrspace(1)* %1147 to <4 x i8> addrspace(1)*
  store <4 x i8> %1152, <4 x i8> addrspace(1)* %1153, align 4, !tbaa !12
  %1154 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %15, i64 0, i32 0, i64 0
  %1155 = bitcast [64 x i32] addrspace(5)* %3 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 256, i8 addrspace(5)* %1155) #4
  %1156 = load i8, i8 addrspace(1)* %1154, align 1, !tbaa !12
  %1157 = zext i8 %1156 to i32
  %1158 = shl nuw i32 %1157, 24
  %1159 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 1
  %1160 = load i8, i8 addrspace(1)* %1159, align 1, !tbaa !12
  %1161 = zext i8 %1160 to i32
  %1162 = shl nuw nsw i32 %1161, 16
  %1163 = or i32 %1162, %1158
  %1164 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 2
  %1165 = load i8, i8 addrspace(1)* %1164, align 1, !tbaa !12
  %1166 = zext i8 %1165 to i32
  %1167 = shl nuw nsw i32 %1166, 8
  %1168 = or i32 %1163, %1167
  %1169 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 3
  %1170 = load i8, i8 addrspace(1)* %1169, align 1, !tbaa !12
  %1171 = zext i8 %1170 to i32
  %1172 = or i32 %1168, %1171
  %1173 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 0
  store i32 %1172, i32 addrspace(5)* %1173, align 16, !tbaa !16
  %1174 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 4
  %1175 = load i8, i8 addrspace(1)* %1174, align 1, !tbaa !12
  %1176 = zext i8 %1175 to i32
  %1177 = shl nuw i32 %1176, 24
  %1178 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 5
  %1179 = load i8, i8 addrspace(1)* %1178, align 1, !tbaa !12
  %1180 = zext i8 %1179 to i32
  %1181 = shl nuw nsw i32 %1180, 16
  %1182 = or i32 %1181, %1177
  %1183 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 6
  %1184 = load i8, i8 addrspace(1)* %1183, align 1, !tbaa !12
  %1185 = zext i8 %1184 to i32
  %1186 = shl nuw nsw i32 %1185, 8
  %1187 = or i32 %1182, %1186
  %1188 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 7
  %1189 = load i8, i8 addrspace(1)* %1188, align 1, !tbaa !12
  %1190 = zext i8 %1189 to i32
  %1191 = or i32 %1187, %1190
  %1192 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 1
  store i32 %1191, i32 addrspace(5)* %1192, align 4, !tbaa !16
  %1193 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 8
  %1194 = load i8, i8 addrspace(1)* %1193, align 1, !tbaa !12
  %1195 = zext i8 %1194 to i32
  %1196 = shl nuw i32 %1195, 24
  %1197 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 9
  %1198 = load i8, i8 addrspace(1)* %1197, align 1, !tbaa !12
  %1199 = zext i8 %1198 to i32
  %1200 = shl nuw nsw i32 %1199, 16
  %1201 = or i32 %1200, %1196
  %1202 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 10
  %1203 = load i8, i8 addrspace(1)* %1202, align 1, !tbaa !12
  %1204 = zext i8 %1203 to i32
  %1205 = shl nuw nsw i32 %1204, 8
  %1206 = or i32 %1201, %1205
  %1207 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 11
  %1208 = load i8, i8 addrspace(1)* %1207, align 1, !tbaa !12
  %1209 = zext i8 %1208 to i32
  %1210 = or i32 %1206, %1209
  %1211 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 2
  store i32 %1210, i32 addrspace(5)* %1211, align 8, !tbaa !16
  %1212 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 12
  %1213 = load i8, i8 addrspace(1)* %1212, align 1, !tbaa !12
  %1214 = zext i8 %1213 to i32
  %1215 = shl nuw i32 %1214, 24
  %1216 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 13
  %1217 = load i8, i8 addrspace(1)* %1216, align 1, !tbaa !12
  %1218 = zext i8 %1217 to i32
  %1219 = shl nuw nsw i32 %1218, 16
  %1220 = or i32 %1219, %1215
  %1221 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 14
  %1222 = load i8, i8 addrspace(1)* %1221, align 1, !tbaa !12
  %1223 = zext i8 %1222 to i32
  %1224 = shl nuw nsw i32 %1223, 8
  %1225 = or i32 %1220, %1224
  %1226 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 15
  %1227 = load i8, i8 addrspace(1)* %1226, align 1, !tbaa !12
  %1228 = zext i8 %1227 to i32
  %1229 = or i32 %1225, %1228
  %1230 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 3
  store i32 %1229, i32 addrspace(5)* %1230, align 4, !tbaa !16
  %1231 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 16
  %1232 = load i8, i8 addrspace(1)* %1231, align 1, !tbaa !12
  %1233 = zext i8 %1232 to i32
  %1234 = shl nuw i32 %1233, 24
  %1235 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 17
  %1236 = load i8, i8 addrspace(1)* %1235, align 1, !tbaa !12
  %1237 = zext i8 %1236 to i32
  %1238 = shl nuw nsw i32 %1237, 16
  %1239 = or i32 %1238, %1234
  %1240 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 18
  %1241 = load i8, i8 addrspace(1)* %1240, align 1, !tbaa !12
  %1242 = zext i8 %1241 to i32
  %1243 = shl nuw nsw i32 %1242, 8
  %1244 = or i32 %1239, %1243
  %1245 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 19
  %1246 = load i8, i8 addrspace(1)* %1245, align 1, !tbaa !12
  %1247 = zext i8 %1246 to i32
  %1248 = or i32 %1244, %1247
  %1249 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 4
  store i32 %1248, i32 addrspace(5)* %1249, align 16, !tbaa !16
  %1250 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 20
  %1251 = load i8, i8 addrspace(1)* %1250, align 1, !tbaa !12
  %1252 = zext i8 %1251 to i32
  %1253 = shl nuw i32 %1252, 24
  %1254 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 21
  %1255 = load i8, i8 addrspace(1)* %1254, align 1, !tbaa !12
  %1256 = zext i8 %1255 to i32
  %1257 = shl nuw nsw i32 %1256, 16
  %1258 = or i32 %1257, %1253
  %1259 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 22
  %1260 = load i8, i8 addrspace(1)* %1259, align 1, !tbaa !12
  %1261 = zext i8 %1260 to i32
  %1262 = shl nuw nsw i32 %1261, 8
  %1263 = or i32 %1258, %1262
  %1264 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 23
  %1265 = load i8, i8 addrspace(1)* %1264, align 1, !tbaa !12
  %1266 = zext i8 %1265 to i32
  %1267 = or i32 %1263, %1266
  %1268 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 5
  store i32 %1267, i32 addrspace(5)* %1268, align 4, !tbaa !16
  %1269 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 24
  %1270 = load i8, i8 addrspace(1)* %1269, align 1, !tbaa !12
  %1271 = zext i8 %1270 to i32
  %1272 = shl nuw i32 %1271, 24
  %1273 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 25
  %1274 = load i8, i8 addrspace(1)* %1273, align 1, !tbaa !12
  %1275 = zext i8 %1274 to i32
  %1276 = shl nuw nsw i32 %1275, 16
  %1277 = or i32 %1276, %1272
  %1278 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 26
  %1279 = load i8, i8 addrspace(1)* %1278, align 1, !tbaa !12
  %1280 = zext i8 %1279 to i32
  %1281 = shl nuw nsw i32 %1280, 8
  %1282 = or i32 %1277, %1281
  %1283 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 27
  %1284 = load i8, i8 addrspace(1)* %1283, align 1, !tbaa !12
  %1285 = zext i8 %1284 to i32
  %1286 = or i32 %1282, %1285
  %1287 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 6
  store i32 %1286, i32 addrspace(5)* %1287, align 8, !tbaa !16
  %1288 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 28
  %1289 = load i8, i8 addrspace(1)* %1288, align 1, !tbaa !12
  %1290 = zext i8 %1289 to i32
  %1291 = shl nuw i32 %1290, 24
  %1292 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 29
  %1293 = load i8, i8 addrspace(1)* %1292, align 1, !tbaa !12
  %1294 = zext i8 %1293 to i32
  %1295 = shl nuw nsw i32 %1294, 16
  %1296 = or i32 %1295, %1291
  %1297 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 30
  %1298 = load i8, i8 addrspace(1)* %1297, align 1, !tbaa !12
  %1299 = zext i8 %1298 to i32
  %1300 = shl nuw nsw i32 %1299, 8
  %1301 = or i32 %1296, %1300
  %1302 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 31
  %1303 = load i8, i8 addrspace(1)* %1302, align 1, !tbaa !12
  %1304 = zext i8 %1303 to i32
  %1305 = or i32 %1301, %1304
  %1306 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 7
  store i32 %1305, i32 addrspace(5)* %1306, align 4, !tbaa !16
  %1307 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 32
  %1308 = load i8, i8 addrspace(1)* %1307, align 1, !tbaa !12
  %1309 = zext i8 %1308 to i32
  %1310 = shl nuw i32 %1309, 24
  %1311 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 33
  %1312 = load i8, i8 addrspace(1)* %1311, align 1, !tbaa !12
  %1313 = zext i8 %1312 to i32
  %1314 = shl nuw nsw i32 %1313, 16
  %1315 = or i32 %1314, %1310
  %1316 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 34
  %1317 = load i8, i8 addrspace(1)* %1316, align 1, !tbaa !12
  %1318 = zext i8 %1317 to i32
  %1319 = shl nuw nsw i32 %1318, 8
  %1320 = or i32 %1315, %1319
  %1321 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 35
  %1322 = load i8, i8 addrspace(1)* %1321, align 1, !tbaa !12
  %1323 = zext i8 %1322 to i32
  %1324 = or i32 %1320, %1323
  %1325 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 8
  store i32 %1324, i32 addrspace(5)* %1325, align 16, !tbaa !16
  %1326 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 36
  %1327 = load i8, i8 addrspace(1)* %1326, align 1, !tbaa !12
  %1328 = zext i8 %1327 to i32
  %1329 = shl nuw i32 %1328, 24
  %1330 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 37
  %1331 = load i8, i8 addrspace(1)* %1330, align 1, !tbaa !12
  %1332 = zext i8 %1331 to i32
  %1333 = shl nuw nsw i32 %1332, 16
  %1334 = or i32 %1333, %1329
  %1335 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 38
  %1336 = load i8, i8 addrspace(1)* %1335, align 1, !tbaa !12
  %1337 = zext i8 %1336 to i32
  %1338 = shl nuw nsw i32 %1337, 8
  %1339 = or i32 %1334, %1338
  %1340 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 39
  %1341 = load i8, i8 addrspace(1)* %1340, align 1, !tbaa !12
  %1342 = zext i8 %1341 to i32
  %1343 = or i32 %1339, %1342
  %1344 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 9
  store i32 %1343, i32 addrspace(5)* %1344, align 4, !tbaa !16
  %1345 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 40
  %1346 = load i8, i8 addrspace(1)* %1345, align 1, !tbaa !12
  %1347 = zext i8 %1346 to i32
  %1348 = shl nuw i32 %1347, 24
  %1349 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 41
  %1350 = load i8, i8 addrspace(1)* %1349, align 1, !tbaa !12
  %1351 = zext i8 %1350 to i32
  %1352 = shl nuw nsw i32 %1351, 16
  %1353 = or i32 %1352, %1348
  %1354 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 42
  %1355 = load i8, i8 addrspace(1)* %1354, align 1, !tbaa !12
  %1356 = zext i8 %1355 to i32
  %1357 = shl nuw nsw i32 %1356, 8
  %1358 = or i32 %1353, %1357
  %1359 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 43
  %1360 = load i8, i8 addrspace(1)* %1359, align 1, !tbaa !12
  %1361 = zext i8 %1360 to i32
  %1362 = or i32 %1358, %1361
  %1363 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 10
  store i32 %1362, i32 addrspace(5)* %1363, align 8, !tbaa !16
  %1364 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 44
  %1365 = load i8, i8 addrspace(1)* %1364, align 1, !tbaa !12
  %1366 = zext i8 %1365 to i32
  %1367 = shl nuw i32 %1366, 24
  %1368 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 45
  %1369 = load i8, i8 addrspace(1)* %1368, align 1, !tbaa !12
  %1370 = zext i8 %1369 to i32
  %1371 = shl nuw nsw i32 %1370, 16
  %1372 = or i32 %1371, %1367
  %1373 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 46
  %1374 = load i8, i8 addrspace(1)* %1373, align 1, !tbaa !12
  %1375 = zext i8 %1374 to i32
  %1376 = shl nuw nsw i32 %1375, 8
  %1377 = or i32 %1372, %1376
  %1378 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 47
  %1379 = load i8, i8 addrspace(1)* %1378, align 1, !tbaa !12
  %1380 = zext i8 %1379 to i32
  %1381 = or i32 %1377, %1380
  %1382 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 11
  store i32 %1381, i32 addrspace(5)* %1382, align 4, !tbaa !16
  %1383 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 48
  %1384 = load i8, i8 addrspace(1)* %1383, align 1, !tbaa !12
  %1385 = zext i8 %1384 to i32
  %1386 = shl nuw i32 %1385, 24
  %1387 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 49
  %1388 = load i8, i8 addrspace(1)* %1387, align 1, !tbaa !12
  %1389 = zext i8 %1388 to i32
  %1390 = shl nuw nsw i32 %1389, 16
  %1391 = or i32 %1390, %1386
  %1392 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 50
  %1393 = load i8, i8 addrspace(1)* %1392, align 1, !tbaa !12
  %1394 = zext i8 %1393 to i32
  %1395 = shl nuw nsw i32 %1394, 8
  %1396 = or i32 %1391, %1395
  %1397 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 51
  %1398 = load i8, i8 addrspace(1)* %1397, align 1, !tbaa !12
  %1399 = zext i8 %1398 to i32
  %1400 = or i32 %1396, %1399
  %1401 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 12
  store i32 %1400, i32 addrspace(5)* %1401, align 16, !tbaa !16
  %1402 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 52
  %1403 = load i8, i8 addrspace(1)* %1402, align 1, !tbaa !12
  %1404 = zext i8 %1403 to i32
  %1405 = shl nuw i32 %1404, 24
  %1406 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 53
  %1407 = load i8, i8 addrspace(1)* %1406, align 1, !tbaa !12
  %1408 = zext i8 %1407 to i32
  %1409 = shl nuw nsw i32 %1408, 16
  %1410 = or i32 %1409, %1405
  %1411 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 54
  %1412 = load i8, i8 addrspace(1)* %1411, align 1, !tbaa !12
  %1413 = zext i8 %1412 to i32
  %1414 = shl nuw nsw i32 %1413, 8
  %1415 = or i32 %1410, %1414
  %1416 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 0, i64 55
  %1417 = load i8, i8 addrspace(1)* %1416, align 1, !tbaa !12
  %1418 = zext i8 %1417 to i32
  %1419 = or i32 %1415, %1418
  %1420 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 13
  store i32 %1419, i32 addrspace(5)* %1420, align 4, !tbaa !16
  %1421 = load i8, i8 addrspace(1)* %1147, align 1, !tbaa !12
  %1422 = zext i8 %1421 to i32
  %1423 = shl nuw i32 %1422, 24
  %1424 = load i8, i8 addrspace(1)* %1145, align 1, !tbaa !12
  %1425 = zext i8 %1424 to i32
  %1426 = shl nuw nsw i32 %1425, 16
  %1427 = or i32 %1426, %1423
  %1428 = load i8, i8 addrspace(1)* %1143, align 1, !tbaa !12
  %1429 = zext i8 %1428 to i32
  %1430 = shl nuw nsw i32 %1429, 8
  %1431 = or i32 %1427, %1430
  %1432 = load i8, i8 addrspace(1)* %1141, align 1, !tbaa !12
  %1433 = zext i8 %1432 to i32
  %1434 = or i32 %1431, %1433
  %1435 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 14
  store i32 %1434, i32 addrspace(5)* %1435, align 8, !tbaa !16
  %1436 = load i8, i8 addrspace(1)* %1130, align 1, !tbaa !12
  %1437 = zext i8 %1436 to i32
  %1438 = shl nuw i32 %1437, 24
  %1439 = load i8, i8 addrspace(1)* %1129, align 1, !tbaa !12
  %1440 = zext i8 %1439 to i32
  %1441 = shl nuw nsw i32 %1440, 16
  %1442 = or i32 %1441, %1438
  %1443 = load i8, i8 addrspace(1)* %1128, align 1, !tbaa !12
  %1444 = zext i8 %1443 to i32
  %1445 = shl nuw nsw i32 %1444, 8
  %1446 = or i32 %1442, %1445
  %1447 = load i8, i8 addrspace(1)* %1127, align 1, !tbaa !12
  %1448 = zext i8 %1447 to i32
  %1449 = or i32 %1446, %1448
  %1450 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 15
  store i32 %1449, i32 addrspace(5)* %1450, align 4, !tbaa !16
  %1451 = tail call i32 @llvm.fshl.i32(i32 %1434, i32 %1427, i32 15)
  %1452 = tail call i32 @llvm.fshl.i32(i32 %1434, i32 %1427, i32 13)
  %1453 = lshr i32 %1431, 10
  %1454 = xor i32 %1452, %1453
  %1455 = xor i32 %1454, %1451
  %1456 = tail call i32 @llvm.fshl.i32(i32 %1190, i32 %1191, i32 25)
  %1457 = tail call i32 @llvm.fshl.i32(i32 %1191, i32 %1182, i32 14)
  %1458 = xor i32 %1456, %1457
  %1459 = lshr i32 %1191, 3
  %1460 = xor i32 %1458, %1459
  %1461 = add i32 %1460, %1172
  %1462 = add i32 %1461, %1343
  %1463 = add i32 %1462, %1455
  %1464 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 16
  store i32 %1463, i32 addrspace(5)* %1464, align 16, !tbaa !16
  %1465 = tail call i32 @llvm.fshl.i32(i32 %1449, i32 %1442, i32 15)
  %1466 = tail call i32 @llvm.fshl.i32(i32 %1449, i32 %1442, i32 13)
  %1467 = lshr i32 %1446, 10
  %1468 = xor i32 %1466, %1467
  %1469 = xor i32 %1468, %1465
  %1470 = tail call i32 @llvm.fshl.i32(i32 %1209, i32 %1210, i32 25)
  %1471 = tail call i32 @llvm.fshl.i32(i32 %1210, i32 %1201, i32 14)
  %1472 = xor i32 %1470, %1471
  %1473 = lshr i32 %1210, 3
  %1474 = xor i32 %1472, %1473
  %1475 = add i32 %1474, %1191
  %1476 = add i32 %1475, %1362
  %1477 = add i32 %1476, %1469
  %1478 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 17
  store i32 %1477, i32 addrspace(5)* %1478, align 4, !tbaa !16
  %1479 = tail call i32 @llvm.fshl.i32(i32 %1463, i32 %1463, i32 15)
  %1480 = tail call i32 @llvm.fshl.i32(i32 %1463, i32 %1463, i32 13)
  %1481 = xor i32 %1479, %1480
  %1482 = lshr i32 %1463, 10
  %1483 = xor i32 %1481, %1482
  %1484 = tail call i32 @llvm.fshl.i32(i32 %1228, i32 %1229, i32 25)
  %1485 = tail call i32 @llvm.fshl.i32(i32 %1229, i32 %1220, i32 14)
  %1486 = xor i32 %1484, %1485
  %1487 = lshr i32 %1229, 3
  %1488 = xor i32 %1486, %1487
  %1489 = add i32 %1488, %1210
  %1490 = add i32 %1489, %1381
  %1491 = add i32 %1490, %1483
  %1492 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 18
  store i32 %1491, i32 addrspace(5)* %1492, align 8, !tbaa !16
  %1493 = tail call i32 @llvm.fshl.i32(i32 %1477, i32 %1477, i32 15)
  %1494 = tail call i32 @llvm.fshl.i32(i32 %1477, i32 %1477, i32 13)
  %1495 = xor i32 %1493, %1494
  %1496 = lshr i32 %1477, 10
  %1497 = xor i32 %1495, %1496
  %1498 = tail call i32 @llvm.fshl.i32(i32 %1247, i32 %1248, i32 25)
  %1499 = tail call i32 @llvm.fshl.i32(i32 %1248, i32 %1239, i32 14)
  %1500 = xor i32 %1498, %1499
  %1501 = lshr i32 %1248, 3
  %1502 = xor i32 %1500, %1501
  %1503 = add i32 %1502, %1229
  %1504 = add i32 %1503, %1400
  %1505 = add i32 %1504, %1497
  %1506 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 19
  store i32 %1505, i32 addrspace(5)* %1506, align 4, !tbaa !16
  %1507 = tail call i32 @llvm.fshl.i32(i32 %1491, i32 %1491, i32 15)
  %1508 = tail call i32 @llvm.fshl.i32(i32 %1491, i32 %1491, i32 13)
  %1509 = xor i32 %1507, %1508
  %1510 = lshr i32 %1491, 10
  %1511 = xor i32 %1509, %1510
  %1512 = tail call i32 @llvm.fshl.i32(i32 %1266, i32 %1267, i32 25)
  %1513 = tail call i32 @llvm.fshl.i32(i32 %1267, i32 %1258, i32 14)
  %1514 = xor i32 %1512, %1513
  %1515 = lshr i32 %1267, 3
  %1516 = xor i32 %1514, %1515
  %1517 = add i32 %1516, %1248
  %1518 = add i32 %1517, %1419
  %1519 = add i32 %1518, %1511
  %1520 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 20
  store i32 %1519, i32 addrspace(5)* %1520, align 16, !tbaa !16
  %1521 = tail call i32 @llvm.fshl.i32(i32 %1505, i32 %1505, i32 15)
  %1522 = tail call i32 @llvm.fshl.i32(i32 %1505, i32 %1505, i32 13)
  %1523 = xor i32 %1521, %1522
  %1524 = lshr i32 %1505, 10
  %1525 = xor i32 %1523, %1524
  %1526 = tail call i32 @llvm.fshl.i32(i32 %1285, i32 %1286, i32 25)
  %1527 = tail call i32 @llvm.fshl.i32(i32 %1286, i32 %1277, i32 14)
  %1528 = xor i32 %1526, %1527
  %1529 = lshr i32 %1286, 3
  %1530 = xor i32 %1528, %1529
  %1531 = add i32 %1530, %1267
  %1532 = add i32 %1531, %1434
  %1533 = add i32 %1532, %1525
  %1534 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 21
  store i32 %1533, i32 addrspace(5)* %1534, align 4, !tbaa !16
  %1535 = tail call i32 @llvm.fshl.i32(i32 %1519, i32 %1519, i32 15)
  %1536 = tail call i32 @llvm.fshl.i32(i32 %1519, i32 %1519, i32 13)
  %1537 = xor i32 %1535, %1536
  %1538 = lshr i32 %1519, 10
  %1539 = xor i32 %1537, %1538
  %1540 = tail call i32 @llvm.fshl.i32(i32 %1304, i32 %1305, i32 25)
  %1541 = tail call i32 @llvm.fshl.i32(i32 %1305, i32 %1296, i32 14)
  %1542 = xor i32 %1540, %1541
  %1543 = lshr i32 %1305, 3
  %1544 = xor i32 %1542, %1543
  %1545 = add i32 %1544, %1286
  %1546 = add i32 %1545, %1449
  %1547 = add i32 %1546, %1539
  %1548 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 22
  store i32 %1547, i32 addrspace(5)* %1548, align 8, !tbaa !16
  %1549 = tail call i32 @llvm.fshl.i32(i32 %1533, i32 %1533, i32 15)
  %1550 = tail call i32 @llvm.fshl.i32(i32 %1533, i32 %1533, i32 13)
  %1551 = xor i32 %1549, %1550
  %1552 = lshr i32 %1533, 10
  %1553 = xor i32 %1551, %1552
  %1554 = tail call i32 @llvm.fshl.i32(i32 %1323, i32 %1324, i32 25)
  %1555 = tail call i32 @llvm.fshl.i32(i32 %1324, i32 %1315, i32 14)
  %1556 = xor i32 %1554, %1555
  %1557 = lshr i32 %1324, 3
  %1558 = xor i32 %1556, %1557
  %1559 = add i32 %1558, %1305
  %1560 = add i32 %1559, %1463
  %1561 = add i32 %1560, %1553
  %1562 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 23
  store i32 %1561, i32 addrspace(5)* %1562, align 4, !tbaa !16
  %1563 = tail call i32 @llvm.fshl.i32(i32 %1547, i32 %1547, i32 15)
  %1564 = tail call i32 @llvm.fshl.i32(i32 %1547, i32 %1547, i32 13)
  %1565 = xor i32 %1563, %1564
  %1566 = lshr i32 %1547, 10
  %1567 = xor i32 %1565, %1566
  %1568 = tail call i32 @llvm.fshl.i32(i32 %1342, i32 %1343, i32 25)
  %1569 = tail call i32 @llvm.fshl.i32(i32 %1343, i32 %1334, i32 14)
  %1570 = xor i32 %1568, %1569
  %1571 = lshr i32 %1343, 3
  %1572 = xor i32 %1570, %1571
  %1573 = add i32 %1572, %1324
  %1574 = add i32 %1573, %1477
  %1575 = add i32 %1574, %1567
  %1576 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 24
  store i32 %1575, i32 addrspace(5)* %1576, align 16, !tbaa !16
  %1577 = tail call i32 @llvm.fshl.i32(i32 %1561, i32 %1561, i32 15)
  %1578 = tail call i32 @llvm.fshl.i32(i32 %1561, i32 %1561, i32 13)
  %1579 = xor i32 %1577, %1578
  %1580 = lshr i32 %1561, 10
  %1581 = xor i32 %1579, %1580
  %1582 = tail call i32 @llvm.fshl.i32(i32 %1361, i32 %1362, i32 25)
  %1583 = tail call i32 @llvm.fshl.i32(i32 %1362, i32 %1353, i32 14)
  %1584 = xor i32 %1582, %1583
  %1585 = lshr i32 %1362, 3
  %1586 = xor i32 %1584, %1585
  %1587 = add i32 %1586, %1343
  %1588 = add i32 %1587, %1491
  %1589 = add i32 %1588, %1581
  %1590 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 25
  store i32 %1589, i32 addrspace(5)* %1590, align 4, !tbaa !16
  %1591 = tail call i32 @llvm.fshl.i32(i32 %1575, i32 %1575, i32 15)
  %1592 = tail call i32 @llvm.fshl.i32(i32 %1575, i32 %1575, i32 13)
  %1593 = xor i32 %1591, %1592
  %1594 = lshr i32 %1575, 10
  %1595 = xor i32 %1593, %1594
  %1596 = tail call i32 @llvm.fshl.i32(i32 %1380, i32 %1381, i32 25)
  %1597 = tail call i32 @llvm.fshl.i32(i32 %1381, i32 %1372, i32 14)
  %1598 = xor i32 %1596, %1597
  %1599 = lshr i32 %1381, 3
  %1600 = xor i32 %1598, %1599
  %1601 = add i32 %1600, %1362
  %1602 = add i32 %1601, %1505
  %1603 = add i32 %1602, %1595
  %1604 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 26
  store i32 %1603, i32 addrspace(5)* %1604, align 8, !tbaa !16
  %1605 = tail call i32 @llvm.fshl.i32(i32 %1589, i32 %1589, i32 15)
  %1606 = tail call i32 @llvm.fshl.i32(i32 %1589, i32 %1589, i32 13)
  %1607 = xor i32 %1605, %1606
  %1608 = lshr i32 %1589, 10
  %1609 = xor i32 %1607, %1608
  %1610 = tail call i32 @llvm.fshl.i32(i32 %1399, i32 %1400, i32 25)
  %1611 = tail call i32 @llvm.fshl.i32(i32 %1400, i32 %1391, i32 14)
  %1612 = xor i32 %1610, %1611
  %1613 = lshr i32 %1400, 3
  %1614 = xor i32 %1612, %1613
  %1615 = add i32 %1614, %1381
  %1616 = add i32 %1615, %1519
  %1617 = add i32 %1616, %1609
  %1618 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 27
  store i32 %1617, i32 addrspace(5)* %1618, align 4, !tbaa !16
  %1619 = tail call i32 @llvm.fshl.i32(i32 %1603, i32 %1603, i32 15)
  %1620 = tail call i32 @llvm.fshl.i32(i32 %1603, i32 %1603, i32 13)
  %1621 = xor i32 %1619, %1620
  %1622 = lshr i32 %1603, 10
  %1623 = xor i32 %1621, %1622
  %1624 = tail call i32 @llvm.fshl.i32(i32 %1418, i32 %1419, i32 25)
  %1625 = tail call i32 @llvm.fshl.i32(i32 %1419, i32 %1410, i32 14)
  %1626 = xor i32 %1624, %1625
  %1627 = lshr i32 %1419, 3
  %1628 = xor i32 %1626, %1627
  %1629 = add i32 %1628, %1400
  %1630 = add i32 %1629, %1533
  %1631 = add i32 %1630, %1623
  %1632 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 28
  store i32 %1631, i32 addrspace(5)* %1632, align 16, !tbaa !16
  %1633 = tail call i32 @llvm.fshl.i32(i32 %1617, i32 %1617, i32 15)
  %1634 = tail call i32 @llvm.fshl.i32(i32 %1617, i32 %1617, i32 13)
  %1635 = xor i32 %1633, %1634
  %1636 = lshr i32 %1617, 10
  %1637 = xor i32 %1635, %1636
  %1638 = tail call i32 @llvm.fshl.i32(i32 %1433, i32 %1434, i32 25)
  %1639 = tail call i32 @llvm.fshl.i32(i32 %1434, i32 %1427, i32 14)
  %1640 = xor i32 %1638, %1639
  %1641 = lshr i32 %1434, 3
  %1642 = xor i32 %1640, %1641
  %1643 = add i32 %1642, %1419
  %1644 = add i32 %1643, %1547
  %1645 = add i32 %1644, %1637
  %1646 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 29
  store i32 %1645, i32 addrspace(5)* %1646, align 4, !tbaa !16
  %1647 = tail call i32 @llvm.fshl.i32(i32 %1631, i32 %1631, i32 15)
  %1648 = tail call i32 @llvm.fshl.i32(i32 %1631, i32 %1631, i32 13)
  %1649 = xor i32 %1647, %1648
  %1650 = lshr i32 %1631, 10
  %1651 = xor i32 %1649, %1650
  %1652 = tail call i32 @llvm.fshl.i32(i32 %1448, i32 %1449, i32 25)
  %1653 = tail call i32 @llvm.fshl.i32(i32 %1449, i32 %1442, i32 14)
  %1654 = xor i32 %1652, %1653
  %1655 = lshr i32 %1449, 3
  %1656 = xor i32 %1654, %1655
  %1657 = add i32 %1656, %1434
  %1658 = add i32 %1657, %1561
  %1659 = add i32 %1658, %1651
  %1660 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 30
  store i32 %1659, i32 addrspace(5)* %1660, align 8, !tbaa !16
  %1661 = tail call i32 @llvm.fshl.i32(i32 %1645, i32 %1645, i32 15)
  %1662 = tail call i32 @llvm.fshl.i32(i32 %1645, i32 %1645, i32 13)
  %1663 = xor i32 %1661, %1662
  %1664 = lshr i32 %1645, 10
  %1665 = xor i32 %1663, %1664
  %1666 = tail call i32 @llvm.fshl.i32(i32 %1463, i32 %1463, i32 25)
  %1667 = tail call i32 @llvm.fshl.i32(i32 %1463, i32 %1463, i32 14)
  %1668 = xor i32 %1666, %1667
  %1669 = lshr i32 %1463, 3
  %1670 = xor i32 %1668, %1669
  %1671 = add i32 %1670, %1449
  %1672 = add i32 %1671, %1575
  %1673 = add i32 %1672, %1665
  %1674 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 31
  store i32 %1673, i32 addrspace(5)* %1674, align 4, !tbaa !16
  %1675 = tail call i32 @llvm.fshl.i32(i32 %1659, i32 %1659, i32 15)
  %1676 = tail call i32 @llvm.fshl.i32(i32 %1659, i32 %1659, i32 13)
  %1677 = xor i32 %1675, %1676
  %1678 = lshr i32 %1659, 10
  %1679 = xor i32 %1677, %1678
  %1680 = tail call i32 @llvm.fshl.i32(i32 %1477, i32 %1477, i32 25)
  %1681 = tail call i32 @llvm.fshl.i32(i32 %1477, i32 %1477, i32 14)
  %1682 = xor i32 %1680, %1681
  %1683 = lshr i32 %1477, 3
  %1684 = xor i32 %1682, %1683
  %1685 = add i32 %1684, %1463
  %1686 = add i32 %1685, %1589
  %1687 = add i32 %1686, %1679
  %1688 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 32
  store i32 %1687, i32 addrspace(5)* %1688, align 16, !tbaa !16
  %1689 = tail call i32 @llvm.fshl.i32(i32 %1673, i32 %1673, i32 15)
  %1690 = tail call i32 @llvm.fshl.i32(i32 %1673, i32 %1673, i32 13)
  %1691 = xor i32 %1689, %1690
  %1692 = lshr i32 %1673, 10
  %1693 = xor i32 %1691, %1692
  %1694 = tail call i32 @llvm.fshl.i32(i32 %1491, i32 %1491, i32 25)
  %1695 = tail call i32 @llvm.fshl.i32(i32 %1491, i32 %1491, i32 14)
  %1696 = xor i32 %1694, %1695
  %1697 = lshr i32 %1491, 3
  %1698 = xor i32 %1696, %1697
  %1699 = add i32 %1698, %1477
  %1700 = add i32 %1699, %1603
  %1701 = add i32 %1700, %1693
  %1702 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 33
  store i32 %1701, i32 addrspace(5)* %1702, align 4, !tbaa !16
  %1703 = tail call i32 @llvm.fshl.i32(i32 %1687, i32 %1687, i32 15)
  %1704 = tail call i32 @llvm.fshl.i32(i32 %1687, i32 %1687, i32 13)
  %1705 = xor i32 %1703, %1704
  %1706 = lshr i32 %1687, 10
  %1707 = xor i32 %1705, %1706
  %1708 = tail call i32 @llvm.fshl.i32(i32 %1505, i32 %1505, i32 25)
  %1709 = tail call i32 @llvm.fshl.i32(i32 %1505, i32 %1505, i32 14)
  %1710 = xor i32 %1708, %1709
  %1711 = lshr i32 %1505, 3
  %1712 = xor i32 %1710, %1711
  %1713 = add i32 %1712, %1491
  %1714 = add i32 %1713, %1617
  %1715 = add i32 %1714, %1707
  %1716 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 34
  store i32 %1715, i32 addrspace(5)* %1716, align 8, !tbaa !16
  %1717 = tail call i32 @llvm.fshl.i32(i32 %1701, i32 %1701, i32 15)
  %1718 = tail call i32 @llvm.fshl.i32(i32 %1701, i32 %1701, i32 13)
  %1719 = xor i32 %1717, %1718
  %1720 = lshr i32 %1701, 10
  %1721 = xor i32 %1719, %1720
  %1722 = tail call i32 @llvm.fshl.i32(i32 %1519, i32 %1519, i32 25)
  %1723 = tail call i32 @llvm.fshl.i32(i32 %1519, i32 %1519, i32 14)
  %1724 = xor i32 %1722, %1723
  %1725 = lshr i32 %1519, 3
  %1726 = xor i32 %1724, %1725
  %1727 = add i32 %1726, %1505
  %1728 = add i32 %1727, %1631
  %1729 = add i32 %1728, %1721
  %1730 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 35
  store i32 %1729, i32 addrspace(5)* %1730, align 4, !tbaa !16
  %1731 = tail call i32 @llvm.fshl.i32(i32 %1715, i32 %1715, i32 15)
  %1732 = tail call i32 @llvm.fshl.i32(i32 %1715, i32 %1715, i32 13)
  %1733 = xor i32 %1731, %1732
  %1734 = lshr i32 %1715, 10
  %1735 = xor i32 %1733, %1734
  %1736 = tail call i32 @llvm.fshl.i32(i32 %1533, i32 %1533, i32 25)
  %1737 = tail call i32 @llvm.fshl.i32(i32 %1533, i32 %1533, i32 14)
  %1738 = xor i32 %1736, %1737
  %1739 = lshr i32 %1533, 3
  %1740 = xor i32 %1738, %1739
  %1741 = add i32 %1740, %1519
  %1742 = add i32 %1741, %1645
  %1743 = add i32 %1742, %1735
  %1744 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 36
  store i32 %1743, i32 addrspace(5)* %1744, align 16, !tbaa !16
  %1745 = tail call i32 @llvm.fshl.i32(i32 %1729, i32 %1729, i32 15)
  %1746 = tail call i32 @llvm.fshl.i32(i32 %1729, i32 %1729, i32 13)
  %1747 = xor i32 %1745, %1746
  %1748 = lshr i32 %1729, 10
  %1749 = xor i32 %1747, %1748
  %1750 = tail call i32 @llvm.fshl.i32(i32 %1547, i32 %1547, i32 25)
  %1751 = tail call i32 @llvm.fshl.i32(i32 %1547, i32 %1547, i32 14)
  %1752 = xor i32 %1750, %1751
  %1753 = lshr i32 %1547, 3
  %1754 = xor i32 %1752, %1753
  %1755 = add i32 %1754, %1533
  %1756 = add i32 %1755, %1659
  %1757 = add i32 %1756, %1749
  %1758 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 37
  store i32 %1757, i32 addrspace(5)* %1758, align 4, !tbaa !16
  %1759 = tail call i32 @llvm.fshl.i32(i32 %1743, i32 %1743, i32 15)
  %1760 = tail call i32 @llvm.fshl.i32(i32 %1743, i32 %1743, i32 13)
  %1761 = xor i32 %1759, %1760
  %1762 = lshr i32 %1743, 10
  %1763 = xor i32 %1761, %1762
  %1764 = tail call i32 @llvm.fshl.i32(i32 %1561, i32 %1561, i32 25)
  %1765 = tail call i32 @llvm.fshl.i32(i32 %1561, i32 %1561, i32 14)
  %1766 = xor i32 %1764, %1765
  %1767 = lshr i32 %1561, 3
  %1768 = xor i32 %1766, %1767
  %1769 = add i32 %1768, %1547
  %1770 = add i32 %1769, %1673
  %1771 = add i32 %1770, %1763
  %1772 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 38
  store i32 %1771, i32 addrspace(5)* %1772, align 8, !tbaa !16
  %1773 = tail call i32 @llvm.fshl.i32(i32 %1757, i32 %1757, i32 15)
  %1774 = tail call i32 @llvm.fshl.i32(i32 %1757, i32 %1757, i32 13)
  %1775 = xor i32 %1773, %1774
  %1776 = lshr i32 %1757, 10
  %1777 = xor i32 %1775, %1776
  %1778 = tail call i32 @llvm.fshl.i32(i32 %1575, i32 %1575, i32 25)
  %1779 = tail call i32 @llvm.fshl.i32(i32 %1575, i32 %1575, i32 14)
  %1780 = xor i32 %1778, %1779
  %1781 = lshr i32 %1575, 3
  %1782 = xor i32 %1780, %1781
  %1783 = add i32 %1782, %1561
  %1784 = add i32 %1783, %1687
  %1785 = add i32 %1784, %1777
  %1786 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 39
  store i32 %1785, i32 addrspace(5)* %1786, align 4, !tbaa !16
  %1787 = tail call i32 @llvm.fshl.i32(i32 %1771, i32 %1771, i32 15)
  %1788 = tail call i32 @llvm.fshl.i32(i32 %1771, i32 %1771, i32 13)
  %1789 = xor i32 %1787, %1788
  %1790 = lshr i32 %1771, 10
  %1791 = xor i32 %1789, %1790
  %1792 = tail call i32 @llvm.fshl.i32(i32 %1589, i32 %1589, i32 25)
  %1793 = tail call i32 @llvm.fshl.i32(i32 %1589, i32 %1589, i32 14)
  %1794 = xor i32 %1792, %1793
  %1795 = lshr i32 %1589, 3
  %1796 = xor i32 %1794, %1795
  %1797 = add i32 %1796, %1575
  %1798 = add i32 %1797, %1701
  %1799 = add i32 %1798, %1791
  %1800 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 40
  store i32 %1799, i32 addrspace(5)* %1800, align 16, !tbaa !16
  %1801 = tail call i32 @llvm.fshl.i32(i32 %1785, i32 %1785, i32 15)
  %1802 = tail call i32 @llvm.fshl.i32(i32 %1785, i32 %1785, i32 13)
  %1803 = xor i32 %1801, %1802
  %1804 = lshr i32 %1785, 10
  %1805 = xor i32 %1803, %1804
  %1806 = tail call i32 @llvm.fshl.i32(i32 %1603, i32 %1603, i32 25)
  %1807 = tail call i32 @llvm.fshl.i32(i32 %1603, i32 %1603, i32 14)
  %1808 = xor i32 %1806, %1807
  %1809 = lshr i32 %1603, 3
  %1810 = xor i32 %1808, %1809
  %1811 = add i32 %1810, %1589
  %1812 = add i32 %1811, %1715
  %1813 = add i32 %1812, %1805
  %1814 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 41
  store i32 %1813, i32 addrspace(5)* %1814, align 4, !tbaa !16
  %1815 = tail call i32 @llvm.fshl.i32(i32 %1799, i32 %1799, i32 15)
  %1816 = tail call i32 @llvm.fshl.i32(i32 %1799, i32 %1799, i32 13)
  %1817 = xor i32 %1815, %1816
  %1818 = lshr i32 %1799, 10
  %1819 = xor i32 %1817, %1818
  %1820 = tail call i32 @llvm.fshl.i32(i32 %1617, i32 %1617, i32 25)
  %1821 = tail call i32 @llvm.fshl.i32(i32 %1617, i32 %1617, i32 14)
  %1822 = xor i32 %1820, %1821
  %1823 = lshr i32 %1617, 3
  %1824 = xor i32 %1822, %1823
  %1825 = add i32 %1824, %1603
  %1826 = add i32 %1825, %1729
  %1827 = add i32 %1826, %1819
  %1828 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 42
  store i32 %1827, i32 addrspace(5)* %1828, align 8, !tbaa !16
  %1829 = tail call i32 @llvm.fshl.i32(i32 %1813, i32 %1813, i32 15)
  %1830 = tail call i32 @llvm.fshl.i32(i32 %1813, i32 %1813, i32 13)
  %1831 = xor i32 %1829, %1830
  %1832 = lshr i32 %1813, 10
  %1833 = xor i32 %1831, %1832
  %1834 = tail call i32 @llvm.fshl.i32(i32 %1631, i32 %1631, i32 25)
  %1835 = tail call i32 @llvm.fshl.i32(i32 %1631, i32 %1631, i32 14)
  %1836 = xor i32 %1834, %1835
  %1837 = lshr i32 %1631, 3
  %1838 = xor i32 %1836, %1837
  %1839 = add i32 %1838, %1617
  %1840 = add i32 %1839, %1743
  %1841 = add i32 %1840, %1833
  %1842 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 43
  store i32 %1841, i32 addrspace(5)* %1842, align 4, !tbaa !16
  %1843 = tail call i32 @llvm.fshl.i32(i32 %1827, i32 %1827, i32 15)
  %1844 = tail call i32 @llvm.fshl.i32(i32 %1827, i32 %1827, i32 13)
  %1845 = xor i32 %1843, %1844
  %1846 = lshr i32 %1827, 10
  %1847 = xor i32 %1845, %1846
  %1848 = tail call i32 @llvm.fshl.i32(i32 %1645, i32 %1645, i32 25)
  %1849 = tail call i32 @llvm.fshl.i32(i32 %1645, i32 %1645, i32 14)
  %1850 = xor i32 %1848, %1849
  %1851 = lshr i32 %1645, 3
  %1852 = xor i32 %1850, %1851
  %1853 = add i32 %1852, %1631
  %1854 = add i32 %1853, %1757
  %1855 = add i32 %1854, %1847
  %1856 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 44
  store i32 %1855, i32 addrspace(5)* %1856, align 16, !tbaa !16
  %1857 = tail call i32 @llvm.fshl.i32(i32 %1841, i32 %1841, i32 15)
  %1858 = tail call i32 @llvm.fshl.i32(i32 %1841, i32 %1841, i32 13)
  %1859 = xor i32 %1857, %1858
  %1860 = lshr i32 %1841, 10
  %1861 = xor i32 %1859, %1860
  %1862 = tail call i32 @llvm.fshl.i32(i32 %1659, i32 %1659, i32 25)
  %1863 = tail call i32 @llvm.fshl.i32(i32 %1659, i32 %1659, i32 14)
  %1864 = xor i32 %1862, %1863
  %1865 = lshr i32 %1659, 3
  %1866 = xor i32 %1864, %1865
  %1867 = add i32 %1866, %1645
  %1868 = add i32 %1867, %1771
  %1869 = add i32 %1868, %1861
  %1870 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 45
  store i32 %1869, i32 addrspace(5)* %1870, align 4, !tbaa !16
  %1871 = tail call i32 @llvm.fshl.i32(i32 %1855, i32 %1855, i32 15)
  %1872 = tail call i32 @llvm.fshl.i32(i32 %1855, i32 %1855, i32 13)
  %1873 = xor i32 %1871, %1872
  %1874 = lshr i32 %1855, 10
  %1875 = xor i32 %1873, %1874
  %1876 = tail call i32 @llvm.fshl.i32(i32 %1673, i32 %1673, i32 25)
  %1877 = tail call i32 @llvm.fshl.i32(i32 %1673, i32 %1673, i32 14)
  %1878 = xor i32 %1876, %1877
  %1879 = lshr i32 %1673, 3
  %1880 = xor i32 %1878, %1879
  %1881 = add i32 %1880, %1659
  %1882 = add i32 %1881, %1785
  %1883 = add i32 %1882, %1875
  %1884 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 46
  store i32 %1883, i32 addrspace(5)* %1884, align 8, !tbaa !16
  %1885 = tail call i32 @llvm.fshl.i32(i32 %1869, i32 %1869, i32 15)
  %1886 = tail call i32 @llvm.fshl.i32(i32 %1869, i32 %1869, i32 13)
  %1887 = xor i32 %1885, %1886
  %1888 = lshr i32 %1869, 10
  %1889 = xor i32 %1887, %1888
  %1890 = tail call i32 @llvm.fshl.i32(i32 %1687, i32 %1687, i32 25)
  %1891 = tail call i32 @llvm.fshl.i32(i32 %1687, i32 %1687, i32 14)
  %1892 = xor i32 %1890, %1891
  %1893 = lshr i32 %1687, 3
  %1894 = xor i32 %1892, %1893
  %1895 = add i32 %1894, %1673
  %1896 = add i32 %1895, %1799
  %1897 = add i32 %1896, %1889
  %1898 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 47
  store i32 %1897, i32 addrspace(5)* %1898, align 4, !tbaa !16
  %1899 = tail call i32 @llvm.fshl.i32(i32 %1883, i32 %1883, i32 15)
  %1900 = tail call i32 @llvm.fshl.i32(i32 %1883, i32 %1883, i32 13)
  %1901 = xor i32 %1899, %1900
  %1902 = lshr i32 %1883, 10
  %1903 = xor i32 %1901, %1902
  %1904 = tail call i32 @llvm.fshl.i32(i32 %1701, i32 %1701, i32 25)
  %1905 = tail call i32 @llvm.fshl.i32(i32 %1701, i32 %1701, i32 14)
  %1906 = xor i32 %1904, %1905
  %1907 = lshr i32 %1701, 3
  %1908 = xor i32 %1906, %1907
  %1909 = add i32 %1908, %1687
  %1910 = add i32 %1909, %1813
  %1911 = add i32 %1910, %1903
  %1912 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 48
  store i32 %1911, i32 addrspace(5)* %1912, align 16, !tbaa !16
  %1913 = tail call i32 @llvm.fshl.i32(i32 %1897, i32 %1897, i32 15)
  %1914 = tail call i32 @llvm.fshl.i32(i32 %1897, i32 %1897, i32 13)
  %1915 = xor i32 %1913, %1914
  %1916 = lshr i32 %1897, 10
  %1917 = xor i32 %1915, %1916
  %1918 = tail call i32 @llvm.fshl.i32(i32 %1715, i32 %1715, i32 25)
  %1919 = tail call i32 @llvm.fshl.i32(i32 %1715, i32 %1715, i32 14)
  %1920 = xor i32 %1918, %1919
  %1921 = lshr i32 %1715, 3
  %1922 = xor i32 %1920, %1921
  %1923 = add i32 %1922, %1701
  %1924 = add i32 %1923, %1827
  %1925 = add i32 %1924, %1917
  %1926 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 49
  store i32 %1925, i32 addrspace(5)* %1926, align 4, !tbaa !16
  %1927 = tail call i32 @llvm.fshl.i32(i32 %1911, i32 %1911, i32 15)
  %1928 = tail call i32 @llvm.fshl.i32(i32 %1911, i32 %1911, i32 13)
  %1929 = xor i32 %1927, %1928
  %1930 = lshr i32 %1911, 10
  %1931 = xor i32 %1929, %1930
  %1932 = tail call i32 @llvm.fshl.i32(i32 %1729, i32 %1729, i32 25)
  %1933 = tail call i32 @llvm.fshl.i32(i32 %1729, i32 %1729, i32 14)
  %1934 = xor i32 %1932, %1933
  %1935 = lshr i32 %1729, 3
  %1936 = xor i32 %1934, %1935
  %1937 = add i32 %1936, %1715
  %1938 = add i32 %1937, %1841
  %1939 = add i32 %1938, %1931
  %1940 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 50
  store i32 %1939, i32 addrspace(5)* %1940, align 8, !tbaa !16
  %1941 = tail call i32 @llvm.fshl.i32(i32 %1925, i32 %1925, i32 15)
  %1942 = tail call i32 @llvm.fshl.i32(i32 %1925, i32 %1925, i32 13)
  %1943 = xor i32 %1941, %1942
  %1944 = lshr i32 %1925, 10
  %1945 = xor i32 %1943, %1944
  %1946 = tail call i32 @llvm.fshl.i32(i32 %1743, i32 %1743, i32 25)
  %1947 = tail call i32 @llvm.fshl.i32(i32 %1743, i32 %1743, i32 14)
  %1948 = xor i32 %1946, %1947
  %1949 = lshr i32 %1743, 3
  %1950 = xor i32 %1948, %1949
  %1951 = add i32 %1950, %1729
  %1952 = add i32 %1951, %1855
  %1953 = add i32 %1952, %1945
  %1954 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 51
  store i32 %1953, i32 addrspace(5)* %1954, align 4, !tbaa !16
  %1955 = tail call i32 @llvm.fshl.i32(i32 %1939, i32 %1939, i32 15)
  %1956 = tail call i32 @llvm.fshl.i32(i32 %1939, i32 %1939, i32 13)
  %1957 = xor i32 %1955, %1956
  %1958 = lshr i32 %1939, 10
  %1959 = xor i32 %1957, %1958
  %1960 = tail call i32 @llvm.fshl.i32(i32 %1757, i32 %1757, i32 25)
  %1961 = tail call i32 @llvm.fshl.i32(i32 %1757, i32 %1757, i32 14)
  %1962 = xor i32 %1960, %1961
  %1963 = lshr i32 %1757, 3
  %1964 = xor i32 %1962, %1963
  %1965 = add i32 %1964, %1743
  %1966 = add i32 %1965, %1869
  %1967 = add i32 %1966, %1959
  %1968 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 52
  store i32 %1967, i32 addrspace(5)* %1968, align 16, !tbaa !16
  %1969 = tail call i32 @llvm.fshl.i32(i32 %1953, i32 %1953, i32 15)
  %1970 = tail call i32 @llvm.fshl.i32(i32 %1953, i32 %1953, i32 13)
  %1971 = xor i32 %1969, %1970
  %1972 = lshr i32 %1953, 10
  %1973 = xor i32 %1971, %1972
  %1974 = tail call i32 @llvm.fshl.i32(i32 %1771, i32 %1771, i32 25)
  %1975 = tail call i32 @llvm.fshl.i32(i32 %1771, i32 %1771, i32 14)
  %1976 = xor i32 %1974, %1975
  %1977 = lshr i32 %1771, 3
  %1978 = xor i32 %1976, %1977
  %1979 = add i32 %1978, %1757
  %1980 = add i32 %1979, %1883
  %1981 = add i32 %1980, %1973
  %1982 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 53
  store i32 %1981, i32 addrspace(5)* %1982, align 4, !tbaa !16
  %1983 = tail call i32 @llvm.fshl.i32(i32 %1967, i32 %1967, i32 15)
  %1984 = tail call i32 @llvm.fshl.i32(i32 %1967, i32 %1967, i32 13)
  %1985 = xor i32 %1983, %1984
  %1986 = lshr i32 %1967, 10
  %1987 = xor i32 %1985, %1986
  %1988 = tail call i32 @llvm.fshl.i32(i32 %1785, i32 %1785, i32 25)
  %1989 = tail call i32 @llvm.fshl.i32(i32 %1785, i32 %1785, i32 14)
  %1990 = xor i32 %1988, %1989
  %1991 = lshr i32 %1785, 3
  %1992 = xor i32 %1990, %1991
  %1993 = add i32 %1992, %1771
  %1994 = add i32 %1993, %1897
  %1995 = add i32 %1994, %1987
  %1996 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 54
  store i32 %1995, i32 addrspace(5)* %1996, align 8, !tbaa !16
  %1997 = tail call i32 @llvm.fshl.i32(i32 %1981, i32 %1981, i32 15)
  %1998 = tail call i32 @llvm.fshl.i32(i32 %1981, i32 %1981, i32 13)
  %1999 = xor i32 %1997, %1998
  %2000 = lshr i32 %1981, 10
  %2001 = xor i32 %1999, %2000
  %2002 = tail call i32 @llvm.fshl.i32(i32 %1799, i32 %1799, i32 25)
  %2003 = tail call i32 @llvm.fshl.i32(i32 %1799, i32 %1799, i32 14)
  %2004 = xor i32 %2002, %2003
  %2005 = lshr i32 %1799, 3
  %2006 = xor i32 %2004, %2005
  %2007 = add i32 %2006, %1785
  %2008 = add i32 %2007, %1911
  %2009 = add i32 %2008, %2001
  %2010 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 55
  store i32 %2009, i32 addrspace(5)* %2010, align 4, !tbaa !16
  %2011 = tail call i32 @llvm.fshl.i32(i32 %1995, i32 %1995, i32 15)
  %2012 = tail call i32 @llvm.fshl.i32(i32 %1995, i32 %1995, i32 13)
  %2013 = xor i32 %2011, %2012
  %2014 = lshr i32 %1995, 10
  %2015 = xor i32 %2013, %2014
  %2016 = tail call i32 @llvm.fshl.i32(i32 %1813, i32 %1813, i32 25)
  %2017 = tail call i32 @llvm.fshl.i32(i32 %1813, i32 %1813, i32 14)
  %2018 = xor i32 %2016, %2017
  %2019 = lshr i32 %1813, 3
  %2020 = xor i32 %2018, %2019
  %2021 = add i32 %2020, %1799
  %2022 = add i32 %2021, %1925
  %2023 = add i32 %2022, %2015
  %2024 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 56
  store i32 %2023, i32 addrspace(5)* %2024, align 16, !tbaa !16
  %2025 = tail call i32 @llvm.fshl.i32(i32 %2009, i32 %2009, i32 15)
  %2026 = tail call i32 @llvm.fshl.i32(i32 %2009, i32 %2009, i32 13)
  %2027 = xor i32 %2025, %2026
  %2028 = lshr i32 %2009, 10
  %2029 = xor i32 %2027, %2028
  %2030 = tail call i32 @llvm.fshl.i32(i32 %1827, i32 %1827, i32 25)
  %2031 = tail call i32 @llvm.fshl.i32(i32 %1827, i32 %1827, i32 14)
  %2032 = xor i32 %2030, %2031
  %2033 = lshr i32 %1827, 3
  %2034 = xor i32 %2032, %2033
  %2035 = add i32 %2034, %1813
  %2036 = add i32 %2035, %1939
  %2037 = add i32 %2036, %2029
  %2038 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 57
  store i32 %2037, i32 addrspace(5)* %2038, align 4, !tbaa !16
  %2039 = tail call i32 @llvm.fshl.i32(i32 %2023, i32 %2023, i32 15)
  %2040 = tail call i32 @llvm.fshl.i32(i32 %2023, i32 %2023, i32 13)
  %2041 = xor i32 %2039, %2040
  %2042 = lshr i32 %2023, 10
  %2043 = xor i32 %2041, %2042
  %2044 = tail call i32 @llvm.fshl.i32(i32 %1841, i32 %1841, i32 25)
  %2045 = tail call i32 @llvm.fshl.i32(i32 %1841, i32 %1841, i32 14)
  %2046 = xor i32 %2044, %2045
  %2047 = lshr i32 %1841, 3
  %2048 = xor i32 %2046, %2047
  %2049 = add i32 %2048, %1827
  %2050 = add i32 %2049, %1953
  %2051 = add i32 %2050, %2043
  %2052 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 58
  store i32 %2051, i32 addrspace(5)* %2052, align 8, !tbaa !16
  %2053 = tail call i32 @llvm.fshl.i32(i32 %2037, i32 %2037, i32 15)
  %2054 = tail call i32 @llvm.fshl.i32(i32 %2037, i32 %2037, i32 13)
  %2055 = xor i32 %2053, %2054
  %2056 = lshr i32 %2037, 10
  %2057 = xor i32 %2055, %2056
  %2058 = tail call i32 @llvm.fshl.i32(i32 %1855, i32 %1855, i32 25)
  %2059 = tail call i32 @llvm.fshl.i32(i32 %1855, i32 %1855, i32 14)
  %2060 = xor i32 %2058, %2059
  %2061 = lshr i32 %1855, 3
  %2062 = xor i32 %2060, %2061
  %2063 = add i32 %2062, %1841
  %2064 = add i32 %2063, %1967
  %2065 = add i32 %2064, %2057
  %2066 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 59
  store i32 %2065, i32 addrspace(5)* %2066, align 4, !tbaa !16
  %2067 = tail call i32 @llvm.fshl.i32(i32 %2051, i32 %2051, i32 15)
  %2068 = tail call i32 @llvm.fshl.i32(i32 %2051, i32 %2051, i32 13)
  %2069 = xor i32 %2067, %2068
  %2070 = lshr i32 %2051, 10
  %2071 = xor i32 %2069, %2070
  %2072 = tail call i32 @llvm.fshl.i32(i32 %1869, i32 %1869, i32 25)
  %2073 = tail call i32 @llvm.fshl.i32(i32 %1869, i32 %1869, i32 14)
  %2074 = xor i32 %2072, %2073
  %2075 = lshr i32 %1869, 3
  %2076 = xor i32 %2074, %2075
  %2077 = add i32 %2076, %1855
  %2078 = add i32 %2077, %1981
  %2079 = add i32 %2078, %2071
  %2080 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 60
  store i32 %2079, i32 addrspace(5)* %2080, align 16, !tbaa !16
  %2081 = tail call i32 @llvm.fshl.i32(i32 %2065, i32 %2065, i32 15)
  %2082 = tail call i32 @llvm.fshl.i32(i32 %2065, i32 %2065, i32 13)
  %2083 = xor i32 %2081, %2082
  %2084 = lshr i32 %2065, 10
  %2085 = xor i32 %2083, %2084
  %2086 = tail call i32 @llvm.fshl.i32(i32 %1883, i32 %1883, i32 25)
  %2087 = tail call i32 @llvm.fshl.i32(i32 %1883, i32 %1883, i32 14)
  %2088 = xor i32 %2086, %2087
  %2089 = lshr i32 %1883, 3
  %2090 = xor i32 %2088, %2089
  %2091 = add i32 %2090, %1869
  %2092 = add i32 %2091, %1995
  %2093 = add i32 %2092, %2085
  %2094 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 61
  store i32 %2093, i32 addrspace(5)* %2094, align 4, !tbaa !16
  %2095 = tail call i32 @llvm.fshl.i32(i32 %2079, i32 %2079, i32 15)
  %2096 = tail call i32 @llvm.fshl.i32(i32 %2079, i32 %2079, i32 13)
  %2097 = xor i32 %2095, %2096
  %2098 = lshr i32 %2079, 10
  %2099 = xor i32 %2097, %2098
  %2100 = tail call i32 @llvm.fshl.i32(i32 %1897, i32 %1897, i32 25)
  %2101 = tail call i32 @llvm.fshl.i32(i32 %1897, i32 %1897, i32 14)
  %2102 = xor i32 %2100, %2101
  %2103 = lshr i32 %1897, 3
  %2104 = xor i32 %2102, %2103
  %2105 = add i32 %2104, %1883
  %2106 = add i32 %2105, %2009
  %2107 = add i32 %2106, %2099
  %2108 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 62
  store i32 %2107, i32 addrspace(5)* %2108, align 8, !tbaa !16
  %2109 = tail call i32 @llvm.fshl.i32(i32 %2093, i32 %2093, i32 15)
  %2110 = tail call i32 @llvm.fshl.i32(i32 %2093, i32 %2093, i32 13)
  %2111 = xor i32 %2109, %2110
  %2112 = lshr i32 %2093, 10
  %2113 = xor i32 %2111, %2112
  %2114 = tail call i32 @llvm.fshl.i32(i32 %1911, i32 %1911, i32 25)
  %2115 = tail call i32 @llvm.fshl.i32(i32 %1911, i32 %1911, i32 14)
  %2116 = xor i32 %2114, %2115
  %2117 = lshr i32 %1911, 3
  %2118 = xor i32 %2116, %2117
  %2119 = add i32 %2118, %1897
  %2120 = add i32 %2119, %2023
  %2121 = add i32 %2120, %2113
  %2122 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 63
  store i32 %2121, i32 addrspace(5)* %2122, align 4, !tbaa !16
  %2123 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 0
  %2124 = load i32, i32 addrspace(1)* %2123, align 4, !tbaa !16
  %2125 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 1
  %2126 = load i32, i32 addrspace(1)* %2125, align 4, !tbaa !16
  %2127 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 2
  %2128 = load i32, i32 addrspace(1)* %2127, align 4, !tbaa !16
  %2129 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 3
  %2130 = load i32, i32 addrspace(1)* %2129, align 4, !tbaa !16
  %2131 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 4
  %2132 = load i32, i32 addrspace(1)* %2131, align 4, !tbaa !16
  %2133 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 5
  %2134 = load i32, i32 addrspace(1)* %2133, align 4, !tbaa !16
  %2135 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 6
  %2136 = load i32, i32 addrspace(1)* %2135, align 4, !tbaa !16
  %2137 = getelementptr inbounds %struct.SHA256_CTX, %struct.SHA256_CTX addrspace(1)* %0, i64 %14, i32 3, i64 7
  %2138 = load i32, i32 addrspace(1)* %2137, align 4, !tbaa !16
  br label %2139

2139:                                             ; preds = %2139, %1125
  %2140 = phi i32 [ %2124, %1125 ], [ %2209, %2139 ]
  %2141 = phi i32 [ %2126, %1125 ], [ %2178, %2139 ]
  %2142 = phi i32 [ 0, %1125 ], [ %2210, %2139 ]
  %2143 = phi i32 [ %2138, %1125 ], [ %2145, %2139 ]
  %2144 = phi i32 [ %2136, %1125 ], [ %2146, %2139 ]
  %2145 = phi i32 [ %2134, %1125 ], [ %2177, %2139 ]
  %2146 = phi i32 [ %2132, %1125 ], [ %2208, %2139 ]
  %2147 = phi i32 [ %2130, %1125 ], [ %2141, %2139 ]
  %2148 = phi i32 [ %2128, %1125 ], [ %2140, %2139 ]
  %2149 = tail call i32 @llvm.fshl.i32(i32 %2146, i32 %2146, i32 26)
  %2150 = tail call i32 @llvm.fshl.i32(i32 %2146, i32 %2146, i32 21)
  %2151 = xor i32 %2149, %2150
  %2152 = tail call i32 @llvm.fshl.i32(i32 %2146, i32 %2146, i32 7)
  %2153 = xor i32 %2151, %2152
  %2154 = and i32 %2146, %2145
  %2155 = xor i32 %2146, -1
  %2156 = and i32 %2144, %2155
  %2157 = zext i32 %2142 to i64
  %2158 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(1)* @k, i64 0, i64 %2157
  %2159 = load i32, i32 addrspace(1)* %2158, align 8, !tbaa !16
  %2160 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 %2142
  %2161 = load i32, i32 addrspace(5)* %2160, align 8, !tbaa !16
  %2162 = add i32 %2154, %2143
  %2163 = add i32 %2162, %2156
  %2164 = add i32 %2163, %2153
  %2165 = add i32 %2164, %2159
  %2166 = add i32 %2165, %2161
  %2167 = tail call i32 @llvm.fshl.i32(i32 %2140, i32 %2140, i32 30)
  %2168 = tail call i32 @llvm.fshl.i32(i32 %2140, i32 %2140, i32 19)
  %2169 = xor i32 %2167, %2168
  %2170 = tail call i32 @llvm.fshl.i32(i32 %2140, i32 %2140, i32 10)
  %2171 = xor i32 %2169, %2170
  %2172 = xor i32 %2148, %2141
  %2173 = and i32 %2172, %2140
  %2174 = and i32 %2148, %2141
  %2175 = xor i32 %2173, %2174
  %2176 = add i32 %2175, %2171
  %2177 = add i32 %2166, %2147
  %2178 = add i32 %2176, %2166
  %2179 = or i32 %2142, 1
  %2180 = tail call i32 @llvm.fshl.i32(i32 %2177, i32 %2177, i32 26)
  %2181 = tail call i32 @llvm.fshl.i32(i32 %2177, i32 %2177, i32 21)
  %2182 = xor i32 %2180, %2181
  %2183 = tail call i32 @llvm.fshl.i32(i32 %2177, i32 %2177, i32 7)
  %2184 = xor i32 %2182, %2183
  %2185 = and i32 %2177, %2146
  %2186 = xor i32 %2177, -1
  %2187 = and i32 %2145, %2186
  %2188 = zext i32 %2179 to i64
  %2189 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(1)* @k, i64 0, i64 %2188
  %2190 = load i32, i32 addrspace(1)* %2189, align 4, !tbaa !16
  %2191 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(5)* %3, i32 0, i32 %2179
  %2192 = load i32, i32 addrspace(5)* %2191, align 4, !tbaa !16
  %2193 = add i32 %2185, %2144
  %2194 = add i32 %2193, %2187
  %2195 = add i32 %2194, %2184
  %2196 = add i32 %2195, %2190
  %2197 = add i32 %2196, %2192
  %2198 = tail call i32 @llvm.fshl.i32(i32 %2178, i32 %2178, i32 30)
  %2199 = tail call i32 @llvm.fshl.i32(i32 %2178, i32 %2178, i32 19)
  %2200 = xor i32 %2198, %2199
  %2201 = tail call i32 @llvm.fshl.i32(i32 %2178, i32 %2178, i32 10)
  %2202 = xor i32 %2200, %2201
  %2203 = xor i32 %2141, %2140
  %2204 = and i32 %2203, %2178
  %2205 = and i32 %2141, %2140
  %2206 = xor i32 %2204, %2205
  %2207 = add i32 %2206, %2202
  %2208 = add i32 %2197, %2148
  %2209 = add i32 %2207, %2197
  %2210 = add nuw nsw i32 %2142, 2
  %2211 = icmp eq i32 %2210, 64
  br i1 %2211, label %2212, label %2139, !llvm.loop !17

2212:                                             ; preds = %2139
  %2213 = add i32 %2209, %2124
  store i32 %2213, i32 addrspace(1)* %2123, align 4, !tbaa !16
  %2214 = add i32 %2178, %2126
  store i32 %2214, i32 addrspace(1)* %2125, align 4, !tbaa !16
  %2215 = add i32 %2140, %2128
  store i32 %2215, i32 addrspace(1)* %2127, align 4, !tbaa !16
  %2216 = add i32 %2141, %2130
  store i32 %2216, i32 addrspace(1)* %2129, align 4, !tbaa !16
  %2217 = add i32 %2208, %2132
  store i32 %2217, i32 addrspace(1)* %2131, align 4, !tbaa !16
  %2218 = add i32 %2177, %2134
  store i32 %2218, i32 addrspace(1)* %2133, align 4, !tbaa !16
  %2219 = add i32 %2146, %2136
  store i32 %2219, i32 addrspace(1)* %2135, align 4, !tbaa !16
  %2220 = add i32 %2145, %2138
  store i32 %2220, i32 addrspace(1)* %2137, align 4, !tbaa !16
  call void @llvm.lifetime.end.p5i8(i64 256, i8 addrspace(5)* %1155) #4
  %2221 = lshr i32 %2213, 24
  %2222 = trunc i32 %2221 to i8
  store i8 %2222, i8 addrspace(1)* %1, align 1, !tbaa !12
  %2223 = load i32, i32 addrspace(1)* %2125, align 4, !tbaa !16
  %2224 = lshr i32 %2223, 24
  %2225 = trunc i32 %2224 to i8
  %2226 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 4
  store i8 %2225, i8 addrspace(1)* %2226, align 1, !tbaa !12
  %2227 = load i32, i32 addrspace(1)* %2127, align 4, !tbaa !16
  %2228 = lshr i32 %2227, 24
  %2229 = trunc i32 %2228 to i8
  %2230 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 8
  store i8 %2229, i8 addrspace(1)* %2230, align 1, !tbaa !12
  %2231 = load i32, i32 addrspace(1)* %2129, align 4, !tbaa !16
  %2232 = lshr i32 %2231, 24
  %2233 = trunc i32 %2232 to i8
  %2234 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 12
  store i8 %2233, i8 addrspace(1)* %2234, align 1, !tbaa !12
  %2235 = load i32, i32 addrspace(1)* %2131, align 4, !tbaa !16
  %2236 = lshr i32 %2235, 24
  %2237 = trunc i32 %2236 to i8
  %2238 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 16
  store i8 %2237, i8 addrspace(1)* %2238, align 1, !tbaa !12
  %2239 = load i32, i32 addrspace(1)* %2133, align 4, !tbaa !16
  %2240 = lshr i32 %2239, 24
  %2241 = trunc i32 %2240 to i8
  %2242 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 20
  store i8 %2241, i8 addrspace(1)* %2242, align 1, !tbaa !12
  %2243 = load i32, i32 addrspace(1)* %2135, align 4, !tbaa !16
  %2244 = lshr i32 %2243, 24
  %2245 = trunc i32 %2244 to i8
  %2246 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 24
  store i8 %2245, i8 addrspace(1)* %2246, align 1, !tbaa !12
  %2247 = load i32, i32 addrspace(1)* %2137, align 4, !tbaa !16
  %2248 = lshr i32 %2247, 24
  %2249 = trunc i32 %2248 to i8
  %2250 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 28
  store i8 %2249, i8 addrspace(1)* %2250, align 1, !tbaa !12
  %2251 = load i32, i32 addrspace(1)* %2123, align 4, !tbaa !16
  %2252 = lshr i32 %2251, 16
  %2253 = trunc i32 %2252 to i8
  %2254 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 1
  store i8 %2253, i8 addrspace(1)* %2254, align 1, !tbaa !12
  %2255 = load i32, i32 addrspace(1)* %2125, align 4, !tbaa !16
  %2256 = lshr i32 %2255, 16
  %2257 = trunc i32 %2256 to i8
  %2258 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 5
  store i8 %2257, i8 addrspace(1)* %2258, align 1, !tbaa !12
  %2259 = load i32, i32 addrspace(1)* %2127, align 4, !tbaa !16
  %2260 = lshr i32 %2259, 16
  %2261 = trunc i32 %2260 to i8
  %2262 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 9
  store i8 %2261, i8 addrspace(1)* %2262, align 1, !tbaa !12
  %2263 = load i32, i32 addrspace(1)* %2129, align 4, !tbaa !16
  %2264 = lshr i32 %2263, 16
  %2265 = trunc i32 %2264 to i8
  %2266 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 13
  store i8 %2265, i8 addrspace(1)* %2266, align 1, !tbaa !12
  %2267 = load i32, i32 addrspace(1)* %2131, align 4, !tbaa !16
  %2268 = lshr i32 %2267, 16
  %2269 = trunc i32 %2268 to i8
  %2270 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 17
  store i8 %2269, i8 addrspace(1)* %2270, align 1, !tbaa !12
  %2271 = load i32, i32 addrspace(1)* %2133, align 4, !tbaa !16
  %2272 = lshr i32 %2271, 16
  %2273 = trunc i32 %2272 to i8
  %2274 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 21
  store i8 %2273, i8 addrspace(1)* %2274, align 1, !tbaa !12
  %2275 = load i32, i32 addrspace(1)* %2135, align 4, !tbaa !16
  %2276 = lshr i32 %2275, 16
  %2277 = trunc i32 %2276 to i8
  %2278 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 25
  store i8 %2277, i8 addrspace(1)* %2278, align 1, !tbaa !12
  %2279 = load i32, i32 addrspace(1)* %2137, align 4, !tbaa !16
  %2280 = lshr i32 %2279, 16
  %2281 = trunc i32 %2280 to i8
  %2282 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 29
  store i8 %2281, i8 addrspace(1)* %2282, align 1, !tbaa !12
  %2283 = load i32, i32 addrspace(1)* %2123, align 4, !tbaa !16
  %2284 = lshr i32 %2283, 8
  %2285 = trunc i32 %2284 to i8
  %2286 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 2
  store i8 %2285, i8 addrspace(1)* %2286, align 1, !tbaa !12
  %2287 = load i32, i32 addrspace(1)* %2125, align 4, !tbaa !16
  %2288 = lshr i32 %2287, 8
  %2289 = trunc i32 %2288 to i8
  %2290 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 6
  store i8 %2289, i8 addrspace(1)* %2290, align 1, !tbaa !12
  %2291 = load i32, i32 addrspace(1)* %2127, align 4, !tbaa !16
  %2292 = lshr i32 %2291, 8
  %2293 = trunc i32 %2292 to i8
  %2294 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 10
  store i8 %2293, i8 addrspace(1)* %2294, align 1, !tbaa !12
  %2295 = load i32, i32 addrspace(1)* %2129, align 4, !tbaa !16
  %2296 = lshr i32 %2295, 8
  %2297 = trunc i32 %2296 to i8
  %2298 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 14
  store i8 %2297, i8 addrspace(1)* %2298, align 1, !tbaa !12
  %2299 = load i32, i32 addrspace(1)* %2131, align 4, !tbaa !16
  %2300 = lshr i32 %2299, 8
  %2301 = trunc i32 %2300 to i8
  %2302 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 18
  store i8 %2301, i8 addrspace(1)* %2302, align 1, !tbaa !12
  %2303 = load i32, i32 addrspace(1)* %2133, align 4, !tbaa !16
  %2304 = lshr i32 %2303, 8
  %2305 = trunc i32 %2304 to i8
  %2306 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 22
  store i8 %2305, i8 addrspace(1)* %2306, align 1, !tbaa !12
  %2307 = load i32, i32 addrspace(1)* %2135, align 4, !tbaa !16
  %2308 = lshr i32 %2307, 8
  %2309 = trunc i32 %2308 to i8
  %2310 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 26
  store i8 %2309, i8 addrspace(1)* %2310, align 1, !tbaa !12
  %2311 = load i32, i32 addrspace(1)* %2137, align 4, !tbaa !16
  %2312 = lshr i32 %2311, 8
  %2313 = trunc i32 %2312 to i8
  %2314 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 30
  store i8 %2313, i8 addrspace(1)* %2314, align 1, !tbaa !12
  %2315 = load i32, i32 addrspace(1)* %2123, align 4, !tbaa !16
  %2316 = trunc i32 %2315 to i8
  %2317 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 3
  store i8 %2316, i8 addrspace(1)* %2317, align 1, !tbaa !12
  %2318 = load i32, i32 addrspace(1)* %2125, align 4, !tbaa !16
  %2319 = trunc i32 %2318 to i8
  %2320 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 7
  store i8 %2319, i8 addrspace(1)* %2320, align 1, !tbaa !12
  %2321 = load i32, i32 addrspace(1)* %2127, align 4, !tbaa !16
  %2322 = trunc i32 %2321 to i8
  %2323 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 11
  store i8 %2322, i8 addrspace(1)* %2323, align 1, !tbaa !12
  %2324 = load i32, i32 addrspace(1)* %2129, align 4, !tbaa !16
  %2325 = trunc i32 %2324 to i8
  %2326 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 15
  store i8 %2325, i8 addrspace(1)* %2326, align 1, !tbaa !12
  %2327 = load i32, i32 addrspace(1)* %2131, align 4, !tbaa !16
  %2328 = trunc i32 %2327 to i8
  %2329 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 19
  store i8 %2328, i8 addrspace(1)* %2329, align 1, !tbaa !12
  %2330 = load i32, i32 addrspace(1)* %2133, align 4, !tbaa !16
  %2331 = trunc i32 %2330 to i8
  %2332 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 23
  store i8 %2331, i8 addrspace(1)* %2332, align 1, !tbaa !12
  %2333 = load i32, i32 addrspace(1)* %2135, align 4, !tbaa !16
  %2334 = trunc i32 %2333 to i8
  %2335 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 27
  store i8 %2334, i8 addrspace(1)* %2335, align 1, !tbaa !12
  %2336 = load i32, i32 addrspace(1)* %2137, align 4, !tbaa !16
  %2337 = trunc i32 %2336 to i8
  %2338 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 31
  store i8 %2337, i8 addrspace(1)* %2338, align 1, !tbaa !12
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !11, i64 64}
!8 = !{!"_ZTS10SHA256_CTX", !9, i64 0, !11, i64 64, !9, i64 68, !9, i64 76}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!9, !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = !{!11, !11, i64 0}
!17 = distinct !{!17, !14}
