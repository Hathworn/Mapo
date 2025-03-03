; ModuleID = '../data/hip_kernels/6503/7/main.cu'
source_filename = "../data/hip_kernels/6503/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL22convertToRGBTestKernelPKtPhiii = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL22convertToRGBTestKernelPKtPhiii(i16 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 comdat {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = sdiv i32 %2, 8
  %24 = icmp slt i32 %14, %23
  %25 = icmp slt i32 %22, %4
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %275

27:                                               ; preds = %5
  %28 = mul nsw i32 %22, %2
  %29 = shl nsw i32 %14, 3
  %30 = add nsw i32 %28, %29
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %31
  %33 = load i16, i16 addrspace(1)* %32, align 2, !tbaa !7, !amdgpu.noclobber !5
  %34 = zext i16 %33 to i32
  %35 = add nsw i32 %30, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %36
  %38 = load i16, i16 addrspace(1)* %37, align 2, !tbaa !7, !amdgpu.noclobber !5
  %39 = zext i16 %38 to i32
  %40 = shl nuw i32 %39, 16
  %41 = or i32 %40, %34
  %42 = add nsw i32 %30, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %43
  %45 = load i16, i16 addrspace(1)* %44, align 2, !tbaa !7, !amdgpu.noclobber !5
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %30, 3
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %48
  %50 = load i16, i16 addrspace(1)* %49, align 2, !tbaa !7, !amdgpu.noclobber !5
  %51 = zext i16 %50 to i32
  %52 = shl nuw i32 %51, 16
  %53 = or i32 %52, %46
  %54 = add nsw i32 %30, 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %55
  %57 = load i16, i16 addrspace(1)* %56, align 2, !tbaa !7, !amdgpu.noclobber !5
  %58 = zext i16 %57 to i32
  %59 = add nsw i32 %30, 5
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %60
  %62 = load i16, i16 addrspace(1)* %61, align 2, !tbaa !7, !amdgpu.noclobber !5
  %63 = zext i16 %62 to i32
  %64 = shl nuw i32 %63, 16
  %65 = or i32 %64, %58
  %66 = add nsw i32 %30, 6
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %67
  %69 = load i16, i16 addrspace(1)* %68, align 2, !tbaa !7, !amdgpu.noclobber !5
  %70 = zext i16 %69 to i32
  %71 = add nsw i32 %30, 7
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %72
  %74 = load i16, i16 addrspace(1)* %73, align 2, !tbaa !7, !amdgpu.noclobber !5
  %75 = zext i16 %74 to i32
  %76 = shl nuw i32 %75, 16
  %77 = or i32 %76, %70
  %78 = lshr i32 %39, 4
  %79 = and i32 %78, 1023
  %80 = lshr i32 %41, 10
  %81 = and i32 %80, 1023
  %82 = mul nuw nsw i32 %81, 1000
  %83 = and i32 %34, 1023
  %84 = lshr i32 %51, 4
  %85 = and i32 %84, 1023
  %86 = mul nuw nsw i32 %85, 1000
  %87 = lshr i32 %53, 10
  %88 = and i32 %87, 1023
  %89 = and i32 %46, 1023
  %90 = mul nuw nsw i32 %89, 1000
  %91 = lshr i32 %63, 4
  %92 = and i32 %91, 1023
  %93 = lshr i32 %65, 10
  %94 = and i32 %93, 1023
  %95 = mul nuw nsw i32 %94, 1000
  %96 = and i32 %58, 1023
  %97 = lshr i32 %75, 4
  %98 = and i32 %97, 1023
  %99 = mul nuw nsw i32 %98, 1000
  %100 = lshr i32 %77, 10
  %101 = and i32 %100, 1023
  %102 = and i32 %70, 1023
  %103 = mul nuw nsw i32 %102, 1000
  %104 = mul nsw i32 %14, 18
  %105 = mul nsw i32 %28, 9
  %106 = sdiv i32 %105, 4
  %107 = mul nuw nsw i32 %79, 1407
  %108 = add nsw i32 %107, -720384
  %109 = mul nuw nsw i32 %79, 716
  %110 = mul nuw nsw i32 %83, 345
  %111 = add nuw nsw i32 %110, -543232
  %112 = add nsw i32 %111, %109
  %113 = mul nuw nsw i32 %83, 1779
  %114 = add nsw i32 %113, -910848
  %115 = add nsw i32 %82, %108
  %116 = uitofp i32 %115 to double
  %117 = fmul contract double %116, 2.490000e-01
  %118 = fdiv contract double %117, 1.000000e+03
  %119 = fptoui double %118 to i8
  %120 = add nsw i32 %106, %104
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %121
  store i8 %119, i8 addrspace(1)* %122, align 1, !tbaa !11
  %123 = sub nsw i32 %82, %112
  %124 = uitofp i32 %123 to double
  %125 = fmul contract double %124, 2.490000e-01
  %126 = fdiv contract double %125, 1.000000e+03
  %127 = fptoui double %126 to i8
  %128 = add nsw i32 %120, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %129
  store i8 %127, i8 addrspace(1)* %130, align 1, !tbaa !11
  %131 = add nsw i32 %82, %114
  %132 = uitofp i32 %131 to double
  %133 = fmul contract double %132, 2.490000e-01
  %134 = fdiv contract double %133, 1.000000e+03
  %135 = fptoui double %134 to i8
  %136 = add nsw i32 %120, 2
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %137
  store i8 %135, i8 addrspace(1)* %138, align 1, !tbaa !11
  %139 = add nsw i32 %108, %90
  %140 = uitofp i32 %139 to double
  %141 = fmul contract double %140, 2.490000e-01
  %142 = fdiv contract double %141, 1.000000e+03
  %143 = fptoui double %142 to i8
  %144 = add nsw i32 %120, 3
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %145
  store i8 %143, i8 addrspace(1)* %146, align 1, !tbaa !11
  %147 = sub nsw i32 %90, %112
  %148 = uitofp i32 %147 to double
  %149 = fmul contract double %148, 2.490000e-01
  %150 = fdiv contract double %149, 1.000000e+03
  %151 = fptoui double %150 to i8
  %152 = add nsw i32 %120, 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %153
  store i8 %151, i8 addrspace(1)* %154, align 1, !tbaa !11
  %155 = add nsw i32 %90, %114
  %156 = uitofp i32 %155 to double
  %157 = fmul contract double %156, 2.490000e-01
  %158 = fdiv contract double %157, 1.000000e+03
  %159 = fptoui double %158 to i8
  %160 = add nsw i32 %120, 5
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %161
  store i8 %159, i8 addrspace(1)* %162, align 1, !tbaa !11
  %163 = mul nuw nsw i32 %96, 1407
  %164 = add nsw i32 %163, -720384
  %165 = mul nuw nsw i32 %96, 716
  %166 = mul nuw nsw i32 %88, 345
  %167 = add nsw i32 %165, -543232
  %168 = add nsw i32 %167, %166
  %169 = mul nuw nsw i32 %88, 1779
  %170 = add nsw i32 %169, -910848
  %171 = add nsw i32 %164, %86
  %172 = uitofp i32 %171 to double
  %173 = fmul contract double %172, 2.490000e-01
  %174 = fdiv contract double %173, 1.000000e+03
  %175 = fptoui double %174 to i8
  %176 = add nsw i32 %120, 6
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %177
  store i8 %175, i8 addrspace(1)* %178, align 1, !tbaa !11
  %179 = sub nsw i32 %86, %168
  %180 = uitofp i32 %179 to double
  %181 = fmul contract double %180, 2.490000e-01
  %182 = fdiv contract double %181, 1.000000e+03
  %183 = fptoui double %182 to i8
  %184 = add nsw i32 %120, 7
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %185
  store i8 %183, i8 addrspace(1)* %186, align 1, !tbaa !11
  %187 = add nsw i32 %170, %86
  %188 = uitofp i32 %187 to double
  %189 = fmul contract double %188, 2.490000e-01
  %190 = fdiv contract double %189, 1.000000e+03
  %191 = fptoui double %190 to i8
  %192 = add nsw i32 %120, 8
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %193
  store i8 %191, i8 addrspace(1)* %194, align 1, !tbaa !11
  %195 = add nsw i32 %95, %164
  %196 = uitofp i32 %195 to double
  %197 = fmul contract double %196, 2.490000e-01
  %198 = fdiv contract double %197, 1.000000e+03
  %199 = fptoui double %198 to i8
  %200 = add nsw i32 %120, 9
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %201
  store i8 %199, i8 addrspace(1)* %202, align 1, !tbaa !11
  %203 = sub nsw i32 %95, %168
  %204 = uitofp i32 %203 to double
  %205 = fmul contract double %204, 2.490000e-01
  %206 = fdiv contract double %205, 1.000000e+03
  %207 = fptoui double %206 to i8
  %208 = add nsw i32 %120, 10
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %209
  store i8 %207, i8 addrspace(1)* %210, align 1, !tbaa !11
  %211 = add nsw i32 %95, %170
  %212 = uitofp i32 %211 to double
  %213 = fmul contract double %212, 2.490000e-01
  %214 = fdiv contract double %213, 1.000000e+03
  %215 = fptoui double %214 to i8
  %216 = add nsw i32 %120, 11
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %217
  store i8 %215, i8 addrspace(1)* %218, align 1, !tbaa !11
  %219 = mul nuw nsw i32 %101, 1407
  %220 = add nsw i32 %219, -720384
  %221 = mul nuw nsw i32 %101, 716
  %222 = mul nuw nsw i32 %92, 345
  %223 = add nuw nsw i32 %222, -543232
  %224 = add nsw i32 %223, %221
  %225 = mul nuw nsw i32 %92, 1779
  %226 = add nsw i32 %225, -910848
  %227 = add nsw i32 %220, %103
  %228 = uitofp i32 %227 to double
  %229 = fmul contract double %228, 2.490000e-01
  %230 = fdiv contract double %229, 1.000000e+03
  %231 = fptoui double %230 to i8
  %232 = add nsw i32 %120, 12
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %233
  store i8 %231, i8 addrspace(1)* %234, align 1, !tbaa !11
  %235 = sub nsw i32 %103, %224
  %236 = uitofp i32 %235 to double
  %237 = fmul contract double %236, 2.490000e-01
  %238 = fdiv contract double %237, 1.000000e+03
  %239 = fptoui double %238 to i8
  %240 = add nsw i32 %120, 13
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %241
  store i8 %239, i8 addrspace(1)* %242, align 1, !tbaa !11
  %243 = add nsw i32 %226, %103
  %244 = uitofp i32 %243 to double
  %245 = fmul contract double %244, 2.490000e-01
  %246 = fdiv contract double %245, 1.000000e+03
  %247 = fptoui double %246 to i8
  %248 = add nsw i32 %120, 14
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %249
  store i8 %247, i8 addrspace(1)* %250, align 1, !tbaa !11
  %251 = add nsw i32 %220, %99
  %252 = uitofp i32 %251 to double
  %253 = fmul contract double %252, 2.490000e-01
  %254 = fdiv contract double %253, 1.000000e+03
  %255 = fptoui double %254 to i8
  %256 = add nsw i32 %120, 15
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %257
  store i8 %255, i8 addrspace(1)* %258, align 1, !tbaa !11
  %259 = sub nsw i32 %99, %224
  %260 = uitofp i32 %259 to double
  %261 = fmul contract double %260, 2.490000e-01
  %262 = fdiv contract double %261, 1.000000e+03
  %263 = fptoui double %262 to i8
  %264 = add nsw i32 %120, 16
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %265
  store i8 %263, i8 addrspace(1)* %266, align 1, !tbaa !11
  %267 = add nsw i32 %99, %226
  %268 = uitofp i32 %267 to double
  %269 = fmul contract double %268, 2.490000e-01
  %270 = fdiv contract double %269, 1.000000e+03
  %271 = fptoui double %270 to i8
  %272 = add nsw i32 %120, 17
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %273
  store i8 %271, i8 addrspace(1)* %274, align 1, !tbaa !11
  br label %275

275:                                              ; preds = %27, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
