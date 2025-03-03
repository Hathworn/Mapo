; ModuleID = '../data/hip_kernels/8192/225/main.cu'
source_filename = "../data/hip_kernels/8192/225/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@operationMaskConstant = protected addrspace(4) externally_initialized global [72 x float] zeroinitializer, align 16
@cubeTexCoordinatesConstant = protected addrspace(4) externally_initialized global [48 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([48 x float] addrspace(4)* @cubeTexCoordinatesConstant to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast ([72 x float] addrspace(4)* @operationMaskConstant to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19ComputeCubes2KernelPfS_ifS_S_Pifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, float %3, float addrspace(1)* nocapture readnone %4, float addrspace(1)* nocapture readnone %5, i32 addrspace(1)* nocapture readonly %6, float %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = udiv i32 %17, %14
  %21 = mul i32 %20, %14
  %22 = icmp ugt i32 %17, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %19
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %25, %18
  %28 = mul i32 %27, %14
  %29 = add i32 %28, %26
  %30 = mul nsw i32 %8, 6
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %241

32:                                               ; preds = %9
  %33 = freeze i32 %29
  %34 = sdiv i32 %33, 6
  %35 = sitofp i32 %34 to float
  %36 = mul i32 %34, 6
  %37 = sub i32 %33, %36
  %38 = mul nsw i32 %34, 3
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !5
  %42 = add nsw i32 %38, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !5
  %46 = add nsw i32 %38, 2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !5
  %50 = sext i32 %34 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !20, !amdgpu.noclobber !5
  %53 = icmp eq i32 %52, 1
  %54 = uitofp i1 %53 to float
  %55 = fmul contract float %54, 5.000000e-01
  %56 = fmul contract float %55, %3
  %57 = mul i32 %8, 72
  %58 = add nsw i32 %57, %2
  %59 = sitofp i32 %8 to float
  %60 = fmul contract float %59, %7
  %61 = mul nsw i32 %37, 12
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %62
  %64 = load float, float addrspace(4)* %63, align 16, !tbaa !16
  %65 = fmul contract float %64, %56
  %66 = fadd contract float %41, %65
  %67 = mul nsw i32 %34, 72
  %68 = add nsw i32 %67, %2
  %69 = add nsw i32 %68, %61
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  store float %66, float addrspace(1)* %71, align 4, !tbaa !16
  %72 = or i32 %61, 1
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %73
  %75 = load float, float addrspace(4)* %74, align 4, !tbaa !16
  %76 = fmul contract float %75, %56
  %77 = fadd contract float %45, %76
  %78 = add nsw i32 %69, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  store float %77, float addrspace(1)* %80, align 4, !tbaa !16
  %81 = or i32 %61, 2
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %82
  %84 = load float, float addrspace(4)* %83, align 8, !tbaa !16
  %85 = fmul contract float %56, %84
  %86 = fadd contract float %49, %85
  %87 = add nsw i32 %69, 2
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  store float %86, float addrspace(1)* %89, align 4, !tbaa !16
  %90 = or i32 %61, 3
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %91
  %93 = load float, float addrspace(4)* %92, align 4, !tbaa !16
  %94 = fmul contract float %56, %93
  %95 = fadd contract float %41, %94
  %96 = add nsw i32 %69, 3
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  store float %95, float addrspace(1)* %98, align 4, !tbaa !16
  %99 = add nsw i32 %61, 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %100
  %102 = load float, float addrspace(4)* %101, align 16, !tbaa !16
  %103 = fmul contract float %56, %102
  %104 = fadd contract float %45, %103
  %105 = add nsw i32 %69, 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  store float %104, float addrspace(1)* %107, align 4, !tbaa !16
  %108 = add nsw i32 %61, 5
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %109
  %111 = load float, float addrspace(4)* %110, align 4, !tbaa !16
  %112 = fmul contract float %56, %111
  %113 = fadd contract float %49, %112
  %114 = add nsw i32 %69, 5
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  store float %113, float addrspace(1)* %116, align 4, !tbaa !16
  %117 = add nsw i32 %61, 6
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %118
  %120 = load float, float addrspace(4)* %119, align 8, !tbaa !16
  %121 = fmul contract float %56, %120
  %122 = fadd contract float %41, %121
  %123 = add nsw i32 %69, 6
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  store float %122, float addrspace(1)* %125, align 4, !tbaa !16
  %126 = add nsw i32 %61, 7
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %127
  %129 = load float, float addrspace(4)* %128, align 4, !tbaa !16
  %130 = fmul contract float %56, %129
  %131 = fadd contract float %45, %130
  %132 = add nsw i32 %69, 7
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  store float %131, float addrspace(1)* %134, align 4, !tbaa !16
  %135 = add nsw i32 %61, 8
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %136
  %138 = load float, float addrspace(4)* %137, align 16, !tbaa !16
  %139 = fmul contract float %56, %138
  %140 = fadd contract float %49, %139
  %141 = add nsw i32 %69, 8
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %1, i64 %142
  store float %140, float addrspace(1)* %143, align 4, !tbaa !16
  %144 = add nsw i32 %61, 9
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %145
  %147 = load float, float addrspace(4)* %146, align 4, !tbaa !16
  %148 = fmul contract float %56, %147
  %149 = fadd contract float %41, %148
  %150 = add nsw i32 %69, 9
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  store float %149, float addrspace(1)* %152, align 4, !tbaa !16
  %153 = add nsw i32 %61, 10
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %154
  %156 = load float, float addrspace(4)* %155, align 8, !tbaa !16
  %157 = fmul contract float %56, %156
  %158 = fadd contract float %45, %157
  %159 = add nsw i32 %69, 10
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %1, i64 %160
  store float %158, float addrspace(1)* %161, align 4, !tbaa !16
  %162 = add nsw i32 %61, 11
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [72 x float], [72 x float] addrspace(4)* @operationMaskConstant, i64 0, i64 %163
  %165 = load float, float addrspace(4)* %164, align 4, !tbaa !16
  %166 = fmul contract float %56, %165
  %167 = fadd contract float %49, %166
  %168 = add nsw i32 %69, 11
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %169
  store float %167, float addrspace(1)* %170, align 4, !tbaa !16
  %171 = shl nsw i32 %37, 3
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [48 x float], [48 x float] addrspace(4)* @cubeTexCoordinatesConstant, i64 0, i64 %172
  %174 = load float, float addrspace(4)* %173, align 16, !tbaa !16
  %175 = fadd contract float %174, %35
  %176 = fmul contract float %175, %7
  %177 = fdiv contract float %176, %60
  %178 = mul nsw i32 %34, 48
  %179 = add nsw i32 %58, %178
  %180 = add nsw i32 %179, %171
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %1, i64 %181
  store float %177, float addrspace(1)* %182, align 4, !tbaa !16
  %183 = add nuw nsw i32 %171, 1
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [48 x float], [48 x float] addrspace(4)* @cubeTexCoordinatesConstant, i64 0, i64 %184
  %186 = load float, float addrspace(4)* %185, align 4, !tbaa !16
  %187 = add nsw i32 %180, 1
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %1, i64 %188
  store float %186, float addrspace(1)* %189, align 4, !tbaa !16
  %190 = add nuw nsw i32 %171, 2
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [48 x float], [48 x float] addrspace(4)* @cubeTexCoordinatesConstant, i64 0, i64 %191
  %193 = load float, float addrspace(4)* %192, align 8, !tbaa !16
  %194 = fadd contract float %193, %35
  %195 = fmul contract float %194, %7
  %196 = fdiv contract float %195, %60
  %197 = add nsw i32 %180, 2
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %1, i64 %198
  store float %196, float addrspace(1)* %199, align 4, !tbaa !16
  %200 = add nuw nsw i32 %171, 3
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [48 x float], [48 x float] addrspace(4)* @cubeTexCoordinatesConstant, i64 0, i64 %201
  %203 = load float, float addrspace(4)* %202, align 4, !tbaa !16
  %204 = add nsw i32 %180, 3
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %1, i64 %205
  store float %203, float addrspace(1)* %206, align 4, !tbaa !16
  %207 = add nuw nsw i32 %171, 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [48 x float], [48 x float] addrspace(4)* @cubeTexCoordinatesConstant, i64 0, i64 %208
  %210 = load float, float addrspace(4)* %209, align 16, !tbaa !16
  %211 = fadd contract float %210, %35
  %212 = fmul contract float %211, %7
  %213 = fdiv contract float %212, %60
  %214 = add nsw i32 %180, 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %1, i64 %215
  store float %213, float addrspace(1)* %216, align 4, !tbaa !16
  %217 = add nuw nsw i32 %171, 5
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [48 x float], [48 x float] addrspace(4)* @cubeTexCoordinatesConstant, i64 0, i64 %218
  %220 = load float, float addrspace(4)* %219, align 4, !tbaa !16
  %221 = add nsw i32 %180, 5
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %1, i64 %222
  store float %220, float addrspace(1)* %223, align 4, !tbaa !16
  %224 = add nuw nsw i32 %171, 6
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [48 x float], [48 x float] addrspace(4)* @cubeTexCoordinatesConstant, i64 0, i64 %225
  %227 = load float, float addrspace(4)* %226, align 8, !tbaa !16
  %228 = fadd contract float %227, %35
  %229 = fmul contract float %228, %7
  %230 = fdiv contract float %229, %60
  %231 = add nsw i32 %180, 6
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds float, float addrspace(1)* %1, i64 %232
  store float %230, float addrspace(1)* %233, align 4, !tbaa !16
  %234 = add nuw nsw i32 %171, 7
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [48 x float], [48 x float] addrspace(4)* @cubeTexCoordinatesConstant, i64 0, i64 %235
  %237 = load float, float addrspace(4)* %236, align 4, !tbaa !16
  %238 = add nsw i32 %180, 7
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %1, i64 %239
  store float %237, float addrspace(1)* %240, align 4, !tbaa !16
  br label %241

241:                                              ; preds = %32, %9
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
