; ModuleID = '../data/hip_kernels/8192/221/main.cu'
source_filename = "../data/hip_kernels/8192/221/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18ComputeQuadsKernelPfS_ifPiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* writeonly %1, i32 %2, float %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %15, %12
  %19 = mul i32 %18, %12
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %16
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %24
  %28 = icmp slt i32 %27, %6
  br i1 %28, label %29, label %247

29:                                               ; preds = %7
  %30 = mul nsw i32 %27, 3
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !16, !amdgpu.noclobber !5
  %34 = add nsw i32 %30, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !5
  %38 = add nsw i32 %30, 2
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !5
  %42 = fmul contract float %3, 5.000000e-01
  %43 = sext i32 %27 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !20, !amdgpu.noclobber !5
  %46 = icmp eq i32 %45, 0
  %47 = select i1 %46, float 0.000000e+00, float %42
  %48 = mul i32 %6, 36
  %49 = add nsw i32 %48, %2
  %50 = mul nsw i32 %6, %5
  %51 = sitofp i32 %50 to float
  %52 = fsub contract float %33, %47
  %53 = mul nsw i32 %27, 36
  %54 = add nsw i32 %53, %2
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  store float %52, float addrspace(1)* %56, align 4, !tbaa !16
  %57 = fadd contract float %37, %47
  %58 = add nsw i32 %54, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  store float %57, float addrspace(1)* %60, align 4, !tbaa !16
  %61 = add nsw i32 %54, 2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  store float %41, float addrspace(1)* %63, align 4, !tbaa !16
  %64 = mul nsw i32 %27, %5
  %65 = sitofp i32 %64 to float
  %66 = fdiv contract float %65, %51
  %67 = mul nsw i32 %27, 24
  %68 = add nsw i32 %49, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  store float %66, float addrspace(1)* %70, align 4, !tbaa !16
  %71 = add nsw i32 %68, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  store float 0.000000e+00, float addrspace(1)* %73, align 4, !tbaa !16
  %74 = add nsw i32 %54, 3
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  store float %52, float addrspace(1)* %76, align 4, !tbaa !16
  %77 = fsub contract float %37, %47
  %78 = add nsw i32 %54, 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  store float %77, float addrspace(1)* %80, align 4, !tbaa !16
  %81 = add nsw i32 %54, 5
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  store float %41, float addrspace(1)* %83, align 4, !tbaa !16
  %84 = add nsw i32 %68, 2
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  store float %66, float addrspace(1)* %86, align 4, !tbaa !16
  %87 = add nsw i32 %68, 3
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  store float 1.000000e+00, float addrspace(1)* %89, align 4, !tbaa !16
  %90 = fadd contract float %33, %47
  %91 = add nsw i32 %54, 6
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  store float %90, float addrspace(1)* %93, align 4, !tbaa !16
  %94 = add nsw i32 %54, 7
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  store float %77, float addrspace(1)* %96, align 4, !tbaa !16
  %97 = add nsw i32 %54, 8
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  store float %41, float addrspace(1)* %99, align 4, !tbaa !16
  %100 = add nsw i32 %27, 1
  %101 = mul nsw i32 %100, %5
  %102 = sitofp i32 %101 to float
  %103 = fdiv contract float %102, %51
  %104 = add nsw i32 %68, 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  store float %103, float addrspace(1)* %106, align 4, !tbaa !16
  %107 = add nsw i32 %68, 5
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  store float 1.000000e+00, float addrspace(1)* %109, align 4, !tbaa !16
  %110 = add nsw i32 %54, 9
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  store float %90, float addrspace(1)* %112, align 4, !tbaa !16
  %113 = add nsw i32 %54, 10
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  store float %57, float addrspace(1)* %115, align 4, !tbaa !16
  %116 = add nsw i32 %54, 11
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  store float %41, float addrspace(1)* %118, align 4, !tbaa !16
  %119 = add nsw i32 %68, 6
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  store float %103, float addrspace(1)* %121, align 4, !tbaa !16
  %122 = add nsw i32 %68, 7
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  store float 0.000000e+00, float addrspace(1)* %124, align 4, !tbaa !16
  %125 = add nsw i32 %54, 12
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  store float %52, float addrspace(1)* %127, align 4, !tbaa !16
  %128 = add nsw i32 %54, 13
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  store float %37, float addrspace(1)* %130, align 4, !tbaa !16
  %131 = fadd contract float %41, %47
  %132 = add nsw i32 %54, 14
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  store float %131, float addrspace(1)* %134, align 4, !tbaa !16
  %135 = add nsw i32 %68, 8
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  store float %66, float addrspace(1)* %137, align 4, !tbaa !16
  %138 = add nsw i32 %68, 9
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %139
  store float 1.000000e+00, float addrspace(1)* %140, align 4, !tbaa !16
  %141 = add nsw i32 %54, 15
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %1, i64 %142
  store float %52, float addrspace(1)* %143, align 4, !tbaa !16
  %144 = add nsw i32 %54, 16
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  store float %37, float addrspace(1)* %146, align 4, !tbaa !16
  %147 = fsub contract float %41, %47
  %148 = add nsw i32 %54, 17
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  store float %147, float addrspace(1)* %150, align 4, !tbaa !16
  %151 = add nsw i32 %68, 10
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %152
  store float %66, float addrspace(1)* %153, align 4, !tbaa !16
  %154 = add nsw i32 %68, 11
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %1, i64 %155
  store float 0.000000e+00, float addrspace(1)* %156, align 4, !tbaa !16
  %157 = add nsw i32 %54, 18
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  store float %90, float addrspace(1)* %159, align 4, !tbaa !16
  %160 = add nsw i32 %54, 19
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  store float %37, float addrspace(1)* %162, align 4, !tbaa !16
  %163 = add nsw i32 %54, 20
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  store float %147, float addrspace(1)* %165, align 4, !tbaa !16
  %166 = add nsw i32 %68, 12
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  store float %103, float addrspace(1)* %168, align 4, !tbaa !16
  %169 = add nsw i32 %68, 13
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  store float 0.000000e+00, float addrspace(1)* %171, align 4, !tbaa !16
  %172 = add nsw i32 %54, 21
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %173
  store float %90, float addrspace(1)* %174, align 4, !tbaa !16
  %175 = add nsw i32 %54, 22
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %1, i64 %176
  store float %37, float addrspace(1)* %177, align 4, !tbaa !16
  %178 = add nsw i32 %54, 23
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %179
  store float %131, float addrspace(1)* %180, align 4, !tbaa !16
  %181 = add nsw i32 %68, 14
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  store float %103, float addrspace(1)* %183, align 4, !tbaa !16
  %184 = add nsw i32 %68, 15
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %1, i64 %185
  store float 1.000000e+00, float addrspace(1)* %186, align 4, !tbaa !16
  %187 = add nsw i32 %54, 24
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %1, i64 %188
  store float %33, float addrspace(1)* %189, align 4, !tbaa !16
  %190 = add nsw i32 %54, 25
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %1, i64 %191
  store float %77, float addrspace(1)* %192, align 4, !tbaa !16
  %193 = add nsw i32 %54, 26
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %1, i64 %194
  store float %131, float addrspace(1)* %195, align 4, !tbaa !16
  %196 = add nsw i32 %68, 16
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %1, i64 %197
  store float %103, float addrspace(1)* %198, align 4, !tbaa !16
  %199 = add nsw i32 %68, 17
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %1, i64 %200
  store float 1.000000e+00, float addrspace(1)* %201, align 4, !tbaa !16
  %202 = add nsw i32 %54, 27
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %1, i64 %203
  store float %33, float addrspace(1)* %204, align 4, !tbaa !16
  %205 = add nsw i32 %54, 28
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %1, i64 %206
  store float %77, float addrspace(1)* %207, align 4, !tbaa !16
  %208 = add nsw i32 %54, 29
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %1, i64 %209
  store float %147, float addrspace(1)* %210, align 4, !tbaa !16
  %211 = add nsw i32 %68, 18
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %1, i64 %212
  store float %66, float addrspace(1)* %213, align 4, !tbaa !16
  %214 = add nsw i32 %68, 19
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %1, i64 %215
  store float 1.000000e+00, float addrspace(1)* %216, align 4, !tbaa !16
  %217 = add nsw i32 %54, 30
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %1, i64 %218
  store float %33, float addrspace(1)* %219, align 4, !tbaa !16
  %220 = add nsw i32 %54, 31
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %1, i64 %221
  store float %57, float addrspace(1)* %222, align 4, !tbaa !16
  %223 = add nsw i32 %54, 32
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %1, i64 %224
  store float %147, float addrspace(1)* %225, align 4, !tbaa !16
  %226 = add nsw i32 %68, 20
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds float, float addrspace(1)* %1, i64 %227
  store float %66, float addrspace(1)* %228, align 4, !tbaa !16
  %229 = add nsw i32 %68, 21
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %1, i64 %230
  store float 0.000000e+00, float addrspace(1)* %231, align 4, !tbaa !16
  %232 = add nsw i32 %54, 33
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %1, i64 %233
  store float %33, float addrspace(1)* %234, align 4, !tbaa !16
  %235 = add nsw i32 %54, 34
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds float, float addrspace(1)* %1, i64 %236
  store float %57, float addrspace(1)* %237, align 4, !tbaa !16
  %238 = add nsw i32 %54, 35
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %1, i64 %239
  store float %131, float addrspace(1)* %240, align 4, !tbaa !16
  %241 = add nsw i32 %68, 22
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %1, i64 %242
  store float %103, float addrspace(1)* %243, align 4, !tbaa !16
  %244 = add nsw i32 %68, 23
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %1, i64 %245
  store float 0.000000e+00, float addrspace(1)* %246, align 4, !tbaa !16
  br label %247

247:                                              ; preds = %29, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
