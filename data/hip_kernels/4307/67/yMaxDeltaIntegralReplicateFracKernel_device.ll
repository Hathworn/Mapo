; ModuleID = '../data/hip_kernels/4307/67/main.cu'
source_filename = "../data/hip_kernels/4307/67/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z36yMaxDeltaIntegralReplicateFracKernelPKfPfiiiS0_S0_S0_S0_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = add nsw i32 %3, -1
  %14 = add i32 %13, %10
  %15 = sdiv i32 %14, %10
  %16 = add nsw i32 %4, -1
  %17 = add i32 %16, %11
  %18 = sdiv i32 %17, %11
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = shl i32 %19, 4
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = add i32 %20, %21
  %23 = freeze i32 %22
  %24 = freeze i32 %18
  %25 = sdiv i32 %23, %24
  %26 = mul i32 %25, %24
  %27 = sub i32 %23, %26
  %28 = freeze i32 %15
  %29 = sdiv i32 %25, %28
  %30 = mul i32 %29, %28
  %31 = sub i32 %25, %30
  %32 = icmp slt i32 %29, %2
  %33 = icmp sgt i32 %15, -1
  %34 = and i1 %33, %32
  %35 = icmp sgt i32 %18, -1
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %146

37:                                               ; preds = %12
  %38 = mul nsw i32 %31, %10
  %39 = add nsw i32 %38, 1
  %40 = mul nsw i32 %27, %11
  %41 = add nsw i32 %40, 1
  %42 = mul i32 %18, %15
  %43 = mul i32 %42, %29
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = sext i32 %29 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %5, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = fadd contract float %48, -1.000000e+00
  %50 = tail call float @llvm.ceil.f32(float %49)
  %51 = fptosi float %50 to i32
  %52 = sitofp i32 %51 to float
  %53 = fsub contract float %52, %48
  %54 = fadd contract float %53, 1.000000e+00
  %55 = getelementptr inbounds float, float addrspace(1)* %6, i64 %46
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = tail call float @llvm.floor.f32(float %56)
  %58 = fptosi float %57 to i32
  %59 = sitofp i32 %58 to float
  %60 = fsub contract float %56, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %7, i64 %46
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = tail call float @llvm.floor.f32(float %62)
  %64 = fptosi float %63 to i32
  %65 = add nsw i32 %41, %64
  %66 = icmp slt i32 %65, %4
  %67 = add nsw i32 %39, %51
  %68 = icmp sgt i32 %67, 0
  %69 = select i1 %66, i1 %68, i1 false
  br i1 %69, label %70, label %81

70:                                               ; preds = %37
  %71 = add i32 %38, %51
  %72 = tail call i32 @llvm.smin.i32(i32 %13, i32 %71)
  %73 = tail call i32 @llvm.smax.i32(i32 %72, i32 0)
  %74 = mul nsw i32 %73, %9
  %75 = tail call i32 @llvm.smin.i32(i32 %16, i32 %65)
  %76 = tail call i32 @llvm.smax.i32(i32 %75, i32 0)
  %77 = add nsw i32 %74, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %8, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %81

81:                                               ; preds = %37, %70
  %82 = phi contract float [ %80, %70 ], [ 0.000000e+00, %37 ]
  %83 = add nsw i32 %39, %58
  %84 = icmp slt i32 %83, %3
  %85 = select i1 %66, i1 %84, i1 false
  br i1 %85, label %86, label %96

86:                                               ; preds = %81
  %87 = tail call i32 @llvm.smin.i32(i32 %13, i32 %83)
  %88 = tail call i32 @llvm.smax.i32(i32 %87, i32 0)
  %89 = mul nsw i32 %88, %9
  %90 = tail call i32 @llvm.smin.i32(i32 %16, i32 %65)
  %91 = tail call i32 @llvm.smax.i32(i32 %90, i32 0)
  %92 = add nsw i32 %89, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %8, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %96

96:                                               ; preds = %81, %86
  %97 = phi contract float [ %95, %86 ], [ 0.000000e+00, %81 ]
  %98 = icmp slt i32 %67, %3
  %99 = select contract i1 %98, float %54, float 1.000000e+00
  %100 = fmul contract float %99, %82
  %101 = fadd contract float %100, 0.000000e+00
  %102 = icmp slt i32 %83, 1
  %103 = select contract i1 %102, float 1.000000e+00, float %60
  %104 = fmul contract float %103, %97
  %105 = fadd contract float %101, %104
  %106 = tail call i32 @llvm.smin.i32(i32 %83, i32 %3)
  %107 = tail call i32 @llvm.smax.i32(i32 %106, i32 0)
  %108 = add nsw i32 %4, 1
  %109 = mul nsw i32 %107, %108
  %110 = add nsw i32 %65, 1
  %111 = tail call i32 @llvm.smin.i32(i32 %110, i32 %4)
  %112 = tail call i32 @llvm.smax.i32(i32 %111, i32 0)
  %113 = add nsw i32 %112, %109
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !9
  %117 = fadd contract float %116, %105
  %118 = tail call i32 @llvm.smin.i32(i32 %65, i32 %4)
  %119 = tail call i32 @llvm.smax.i32(i32 %118, i32 0)
  %120 = add nsw i32 %109, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  %124 = fsub contract float %117, %123
  %125 = tail call i32 @llvm.smin.i32(i32 %67, i32 %3)
  %126 = tail call i32 @llvm.smax.i32(i32 %125, i32 0)
  %127 = mul nsw i32 %126, %108
  %128 = add nsw i32 %112, %127
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = fsub contract float %124, %131
  %133 = add nsw i32 %127, %119
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  %137 = fadd contract float %136, %132
  %138 = icmp sgt i32 %65, 0
  %139 = uitofp i1 %66 to float
  %140 = select i1 %138, float %139, float 0.000000e+00
  %141 = fmul contract float %140, %137
  %142 = mul nsw i32 %31, %18
  %143 = add nsw i32 %142, %27
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %45, i64 %144
  store float %141, float addrspace(1)* %145, align 4, !tbaa !5
  br label %146

146:                                              ; preds = %96, %12
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
