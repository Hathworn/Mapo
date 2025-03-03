; ModuleID = '../data/hip_kernels/4307/81/main.cu'
source_filename = "../data/hip_kernels/4307/81/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27yMaxDeltaIntegralFracKernelPKfiPfiiiiiS0_S0_S0_S0_ii(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = shl i32 %15, 8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = add i32 %16, %17
  %19 = freeze i32 %18
  %20 = freeze i32 %7
  %21 = sdiv i32 %19, %20
  %22 = freeze i32 %21
  %23 = freeze i32 %6
  %24 = sdiv i32 %22, %23
  %25 = mul i32 %24, %23
  %26 = sub i32 %22, %25
  %27 = add nsw i32 %26, 1
  %28 = freeze i32 %5
  %29 = sdiv i32 %24, %28
  %30 = mul nsw i32 %29, %1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = mul nsw i32 %29, %13
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %11, i64 %34
  %36 = freeze i32 %29
  %37 = freeze i32 %4
  %38 = sdiv i32 %36, %37
  %39 = icmp slt i32 %38, %3
  br i1 %39, label %40, label %146

40:                                               ; preds = %14
  %41 = mul i32 %38, %37
  %42 = sub i32 %36, %41
  %43 = mul nsw i32 %42, %5
  %44 = mul i32 %29, %28
  %45 = sub i32 %24, %44
  %46 = add nsw i32 %43, %45
  %47 = mul i32 %21, %20
  %48 = sub i32 %19, %47
  %49 = add nsw i32 %48, 1
  %50 = sext i32 %18 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = sext i32 %46 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %8, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = fadd contract float %54, -1.000000e+00
  %56 = tail call float @llvm.ceil.f32(float %55)
  %57 = fptosi float %56 to i32
  %58 = sitofp i32 %57 to float
  %59 = fsub contract float %58, %54
  %60 = fadd contract float %59, 1.000000e+00
  %61 = getelementptr inbounds float, float addrspace(1)* %9, i64 %52
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = tail call float @llvm.floor.f32(float %62)
  %64 = fptosi float %63 to i32
  %65 = sitofp i32 %64 to float
  %66 = fsub contract float %62, %65
  %67 = getelementptr inbounds float, float addrspace(1)* %10, i64 %52
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  %69 = tail call float @llvm.floor.f32(float %68)
  %70 = fptosi float %69 to i32
  %71 = add nsw i32 %49, %70
  %72 = icmp slt i32 %71, %7
  %73 = add nsw i32 %27, %57
  %74 = icmp sgt i32 %73, 0
  %75 = icmp sle i32 %73, %6
  %76 = and i1 %74, %75
  %77 = and i1 %76, %72
  %78 = uitofp i1 %77 to float
  %79 = add nsw i32 %6, -1
  %80 = add i32 %26, %57
  %81 = tail call i32 @llvm.smin.i32(i32 %79, i32 %80)
  %82 = tail call i32 @llvm.smax.i32(i32 %81, i32 0)
  %83 = mul nsw i32 %82, %12
  %84 = add nsw i32 %7, -1
  %85 = tail call i32 @llvm.smin.i32(i32 %84, i32 %71)
  %86 = tail call i32 @llvm.smax.i32(i32 %85, i32 0)
  %87 = add nsw i32 %83, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %35, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5, !amdgpu.noclobber !9
  %91 = fmul contract float %90, %78
  %92 = add nsw i32 %27, %64
  %93 = icmp sgt i32 %92, -1
  %94 = icmp slt i32 %92, %6
  %95 = and i1 %93, %94
  %96 = and i1 %95, %72
  %97 = uitofp i1 %96 to float
  %98 = tail call i32 @llvm.smin.i32(i32 %79, i32 %92)
  %99 = tail call i32 @llvm.smax.i32(i32 %98, i32 0)
  %100 = mul nsw i32 %99, %12
  %101 = add nsw i32 %100, %86
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %35, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = fmul contract float %104, %97
  %106 = fmul contract float %60, %91
  %107 = fadd contract float %106, 0.000000e+00
  %108 = fmul contract float %66, %105
  %109 = fadd contract float %108, %107
  %110 = tail call i32 @llvm.smin.i32(i32 %92, i32 %6)
  %111 = tail call i32 @llvm.smax.i32(i32 %110, i32 0)
  %112 = add nsw i32 %7, 1
  %113 = mul nsw i32 %111, %112
  %114 = add nsw i32 %71, 1
  %115 = tail call i32 @llvm.smin.i32(i32 %114, i32 %7)
  %116 = tail call i32 @llvm.smax.i32(i32 %115, i32 0)
  %117 = add nsw i32 %116, %113
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %32, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5, !amdgpu.noclobber !9
  %121 = fadd contract float %120, %109
  %122 = tail call i32 @llvm.smin.i32(i32 %71, i32 %7)
  %123 = tail call i32 @llvm.smax.i32(i32 %122, i32 0)
  %124 = add nsw i32 %113, %123
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %32, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = fsub contract float %121, %127
  %129 = tail call i32 @llvm.smin.i32(i32 %73, i32 %6)
  %130 = tail call i32 @llvm.smax.i32(i32 %129, i32 0)
  %131 = mul nsw i32 %130, %112
  %132 = add nsw i32 %116, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %32, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5, !amdgpu.noclobber !9
  %136 = fsub contract float %128, %135
  %137 = add nsw i32 %131, %123
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %32, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !5, !amdgpu.noclobber !9
  %141 = fadd contract float %140, %136
  %142 = icmp sgt i32 %71, -1
  %143 = and i1 %142, %72
  %144 = uitofp i1 %143 to float
  %145 = fmul contract float %141, %144
  store float %145, float addrspace(1)* %51, align 4, !tbaa !5
  br label %146

146:                                              ; preds = %40, %14
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
