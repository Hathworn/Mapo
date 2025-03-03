; ModuleID = '../data/hip_kernels/1256/143/main.cu'
source_filename = "../data/hip_kernels/1256/143/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17executeThirdLayerPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = mul nsw i32 %4, 1251
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds float, float addrspace(1)* %1, i64 %6
  %8 = load float, float addrspace(1)* %7, align 4, !tbaa !4, !amdgpu.noclobber !8
  %9 = fadd contract float %8, 0.000000e+00
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = mul i32 %10, 1250
  br label %53

12:                                               ; preds = %53
  %13 = fpext float %165 to double
  %14 = fmul contract double %13, 0x3FE55555571F7693
  %15 = fptrunc double %14 to float
  %16 = tail call float @llvm.fabs.f32(float %15)
  %17 = fcmp olt float %16, 6.250000e-01
  br i1 %17, label %18, label %26

18:                                               ; preds = %12
  %19 = fmul float %15, %15
  %20 = tail call float @llvm.fmuladd.f32(float %19, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float 0xBFAB8389C0000000)
  %22 = tail call float @llvm.fmuladd.f32(float %19, float %21, float 0x3FC1107040000000)
  %23 = tail call float @llvm.fmuladd.f32(float %19, float %22, float 0xBFD5555320000000)
  %24 = fmul float %16, %23
  %25 = tail call float @llvm.fmuladd.f32(float %19, float %24, float %16)
  br label %43

26:                                               ; preds = %12
  %27 = fmul float %16, 2.000000e+00
  %28 = fmul float %27, 0x3FF7154760000000
  %29 = tail call float @llvm.rint.f32(float %28)
  %30 = fcmp ogt float %27, 0x40562E4300000000
  %31 = fneg float %28
  %32 = tail call float @llvm.fma.f32(float %27, float 0x3FF7154760000000, float %31)
  %33 = tail call float @llvm.fma.f32(float %27, float 0x3E54AE0BE0000000, float %32)
  %34 = fsub float %28, %29
  %35 = fadd float %33, %34
  %36 = tail call float @llvm.exp2.f32(float %35)
  %37 = fptosi float %29 to i32
  %38 = tail call float @llvm.amdgcn.ldexp.f32(float %36, i32 %37)
  %39 = fadd float %38, 1.000000e+00
  %40 = select i1 %30, float 0x7FF0000000000000, float %39
  %41 = tail call float @llvm.amdgcn.rcp.f32(float %40)
  %42 = tail call float @llvm.fmuladd.f32(float %41, float -2.000000e+00, float 1.000000e+00)
  br label %43

43:                                               ; preds = %18, %26
  %44 = phi float [ %25, %18 ], [ %42, %26 ]
  %45 = tail call float @llvm.copysign.f32(float %44, float %15)
  %46 = fpext float %45 to double
  %47 = fmul contract double %46, 1.715900e+00
  %48 = fptrunc double %47 to float
  %49 = mul i32 %10, 100
  %50 = add i32 %49, %4
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  store float %48, float addrspace(1)* %52, align 4, !tbaa !4
  ret void

53:                                               ; preds = %53, %3
  %54 = phi i32 [ 0, %3 ], [ %159, %53 ]
  %55 = phi float [ %9, %3 ], [ %165, %53 ]
  %56 = add i32 %54, %11
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !4, !amdgpu.noclobber !8
  %60 = or i32 %54, 1
  %61 = add i32 %60, %5
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !4, !amdgpu.noclobber !8
  %65 = fmul contract float %59, %64
  %66 = fadd contract float %55, %65
  %67 = add i32 %60, %11
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !4, !amdgpu.noclobber !8
  %71 = add nuw nsw i32 %54, 2
  %72 = add i32 %71, %5
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !4, !amdgpu.noclobber !8
  %76 = fmul contract float %70, %75
  %77 = fadd contract float %66, %76
  %78 = add i32 %71, %11
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !4, !amdgpu.noclobber !8
  %82 = add nuw nsw i32 %54, 3
  %83 = add i32 %82, %5
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !4, !amdgpu.noclobber !8
  %87 = fmul contract float %81, %86
  %88 = fadd contract float %77, %87
  %89 = add i32 %82, %11
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !4, !amdgpu.noclobber !8
  %93 = add nuw nsw i32 %54, 4
  %94 = add i32 %93, %5
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !4, !amdgpu.noclobber !8
  %98 = fmul contract float %92, %97
  %99 = fadd contract float %88, %98
  %100 = add i32 %93, %11
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !4, !amdgpu.noclobber !8
  %104 = add nuw nsw i32 %54, 5
  %105 = add i32 %104, %5
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !4, !amdgpu.noclobber !8
  %109 = fmul contract float %103, %108
  %110 = fadd contract float %99, %109
  %111 = add i32 %104, %11
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !4, !amdgpu.noclobber !8
  %115 = add nuw nsw i32 %54, 6
  %116 = add i32 %115, %5
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !4, !amdgpu.noclobber !8
  %120 = fmul contract float %114, %119
  %121 = fadd contract float %110, %120
  %122 = add i32 %115, %11
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !4, !amdgpu.noclobber !8
  %126 = add nuw nsw i32 %54, 7
  %127 = add i32 %126, %5
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !4, !amdgpu.noclobber !8
  %131 = fmul contract float %125, %130
  %132 = fadd contract float %121, %131
  %133 = add i32 %126, %11
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !4, !amdgpu.noclobber !8
  %137 = add nuw nsw i32 %54, 8
  %138 = add i32 %137, %5
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !4, !amdgpu.noclobber !8
  %142 = fmul contract float %136, %141
  %143 = fadd contract float %132, %142
  %144 = add i32 %137, %11
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !4, !amdgpu.noclobber !8
  %148 = add nuw nsw i32 %54, 9
  %149 = add i32 %148, %5
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !4, !amdgpu.noclobber !8
  %153 = fmul contract float %147, %152
  %154 = fadd contract float %143, %153
  %155 = add i32 %148, %11
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !4, !amdgpu.noclobber !8
  %159 = add nuw nsw i32 %54, 10
  %160 = add i32 %159, %5
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !4, !amdgpu.noclobber !8
  %164 = fmul contract float %158, %163
  %165 = fadd contract float %154, %164
  %166 = icmp eq i32 %159, 1250
  br i1 %166, label %12, label %53, !llvm.loop !9
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
