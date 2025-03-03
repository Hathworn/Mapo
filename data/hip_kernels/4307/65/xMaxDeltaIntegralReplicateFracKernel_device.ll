; ModuleID = '../data/hip_kernels/4307/65/main.cu'
source_filename = "../data/hip_kernels/4307/65/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z36xMaxDeltaIntegralReplicateFracKernelPKfPfiiiS0_S0_S0_S0_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
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
  br i1 %36, label %37, label %149

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
  %47 = getelementptr inbounds float, float addrspace(1)* %6, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = fadd contract float %48, -1.000000e+00
  %50 = tail call float @llvm.ceil.f32(float %49)
  %51 = fptosi float %50 to i32
  %52 = sitofp i32 %51 to float
  %53 = fsub contract float %52, %48
  %54 = fadd contract float %53, 1.000000e+00
  %55 = getelementptr inbounds float, float addrspace(1)* %5, i64 %46
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = tail call float @llvm.floor.f32(float %56)
  %58 = fptosi float %57 to i32
  %59 = getelementptr inbounds float, float addrspace(1)* %7, i64 %46
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = tail call float @llvm.floor.f32(float %60)
  %62 = fptosi float %61 to i32
  %63 = sitofp i32 %62 to float
  %64 = fsub contract float %60, %63
  %65 = add nsw i32 %41, %51
  %66 = icmp slt i32 %65, 1
  br i1 %66, label %81, label %67

67:                                               ; preds = %37
  %68 = add nsw i32 %39, %58
  %69 = icmp slt i32 %68, %3
  br i1 %69, label %70, label %81

70:                                               ; preds = %67
  %71 = tail call i32 @llvm.smin.i32(i32 %13, i32 %68)
  %72 = tail call i32 @llvm.smax.i32(i32 %71, i32 0)
  %73 = mul nsw i32 %72, %9
  %74 = add i32 %40, %51
  %75 = tail call i32 @llvm.smin.i32(i32 %16, i32 %74)
  %76 = tail call i32 @llvm.smax.i32(i32 %75, i32 0)
  %77 = add nsw i32 %73, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %8, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %81

81:                                               ; preds = %37, %67, %70
  %82 = phi contract float [ %80, %70 ], [ 0.000000e+00, %67 ], [ 0.000000e+00, %37 ]
  %83 = add nsw i32 %41, %62
  %84 = icmp slt i32 %83, %4
  %85 = add nsw i32 %39, %58
  %86 = icmp slt i32 %85, %3
  %87 = select i1 %84, i1 %86, i1 false
  br i1 %87, label %88, label %98

88:                                               ; preds = %81
  %89 = tail call i32 @llvm.smin.i32(i32 %13, i32 %85)
  %90 = tail call i32 @llvm.smax.i32(i32 %89, i32 0)
  %91 = mul nsw i32 %90, %9
  %92 = tail call i32 @llvm.smin.i32(i32 %16, i32 %83)
  %93 = tail call i32 @llvm.smax.i32(i32 %92, i32 0)
  %94 = add nsw i32 %91, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %8, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %98

98:                                               ; preds = %81, %88
  %99 = phi contract float [ %97, %88 ], [ 0.000000e+00, %81 ]
  %100 = icmp slt i32 %83, 1
  %101 = select contract i1 %100, float 1.000000e+00, float %64
  %102 = fmul contract float %101, %99
  %103 = fadd contract float %102, 0.000000e+00
  %104 = icmp slt i32 %65, %4
  %105 = select contract i1 %104, float %54, float 1.000000e+00
  %106 = fmul contract float %105, %82
  %107 = fadd contract float %106, %103
  %108 = add nsw i32 %85, 1
  %109 = tail call i32 @llvm.smin.i32(i32 %108, i32 %3)
  %110 = tail call i32 @llvm.smax.i32(i32 %109, i32 0)
  %111 = add nsw i32 %4, 1
  %112 = mul nsw i32 %110, %111
  %113 = tail call i32 @llvm.smin.i32(i32 %83, i32 %4)
  %114 = tail call i32 @llvm.smax.i32(i32 %113, i32 0)
  %115 = add nsw i32 %112, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5, !amdgpu.noclobber !9
  %119 = fadd contract float %118, %107
  %120 = tail call i32 @llvm.smin.i32(i32 %85, i32 %3)
  %121 = tail call i32 @llvm.smax.i32(i32 %120, i32 0)
  %122 = mul nsw i32 %121, %111
  %123 = add nsw i32 %122, %114
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5, !amdgpu.noclobber !9
  %127 = fsub contract float %119, %126
  %128 = tail call i32 @llvm.smin.i32(i32 %65, i32 %4)
  %129 = tail call i32 @llvm.smax.i32(i32 %128, i32 0)
  %130 = add nsw i32 %112, %129
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5, !amdgpu.noclobber !9
  %134 = fsub contract float %127, %133
  %135 = add nsw i32 %122, %129
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5, !amdgpu.noclobber !9
  %139 = fadd contract float %138, %134
  %140 = icmp sgt i32 %85, 0
  %141 = icmp slt i32 %85, %3
  %142 = uitofp i1 %141 to float
  %143 = select i1 %140, float %142, float 0.000000e+00
  %144 = fmul contract float %143, %139
  %145 = mul nsw i32 %31, %18
  %146 = add nsw i32 %145, %27
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %45, i64 %147
  store float %144, float addrspace(1)* %148, align 4, !tbaa !5
  br label %149

149:                                              ; preds = %98, %12
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
