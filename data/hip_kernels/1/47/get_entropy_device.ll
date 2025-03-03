; ModuleID = '../data/hip_kernels/1/47/main.cu'
source_filename = "../data/hip_kernels/1/47/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11get_entropyiiiPfiS_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %17, label %129

17:                                               ; preds = %6
  %18 = mul nsw i32 %15, %4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %3, i64 %19
  %21 = icmp sgt i32 %0, 0
  br i1 %21, label %22, label %33

22:                                               ; preds = %17
  %23 = icmp sgt i32 %1, 0
  %24 = sitofp i32 %1 to double
  %25 = and i32 %1, 7
  %26 = icmp ult i32 %1, 8
  %27 = and i32 %1, -8
  %28 = icmp eq i32 %25, 0
  br label %29

29:                                               ; preds = %22, %55
  %30 = phi i32 [ 0, %22 ], [ %65, %55 ]
  %31 = phi float [ 0.000000e+00, %22 ], [ %64, %55 ]
  br i1 %23, label %32, label %55

32:                                               ; preds = %29
  br i1 %26, label %38, label %67

33:                                               ; preds = %55, %17
  %34 = phi float [ 0.000000e+00, %17 ], [ %64, %55 ]
  %35 = fneg contract float %34
  %36 = sext i32 %15 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %5, i64 %36
  store float %35, float addrspace(1)* %37, align 4, !tbaa !7
  br label %129

38:                                               ; preds = %67, %32
  %39 = phi float [ undef, %32 ], [ %125, %67 ]
  %40 = phi i32 [ 0, %32 ], [ %126, %67 ]
  %41 = phi float [ 0.000000e+00, %32 ], [ %125, %67 ]
  br i1 %28, label %55, label %42

42:                                               ; preds = %38, %42
  %43 = phi i32 [ %52, %42 ], [ %40, %38 ]
  %44 = phi float [ %51, %42 ], [ %41, %38 ]
  %45 = phi i32 [ %53, %42 ], [ 0, %38 ]
  %46 = mul nsw i32 %43, %0
  %47 = add nsw i32 %46, %30
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %20, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fadd contract float %44, %50
  %52 = add nuw nsw i32 %43, 1
  %53 = add i32 %45, 1
  %54 = icmp eq i32 %53, %25
  br i1 %54, label %55, label %42, !llvm.loop !11

55:                                               ; preds = %38, %42, %29
  %56 = phi float [ 0.000000e+00, %29 ], [ %39, %38 ], [ %51, %42 ]
  %57 = fpext float %56 to double
  %58 = fdiv contract double %57, %24
  %59 = fptrunc double %58 to float
  %60 = fcmp contract ugt float %59, 0.000000e+00
  %61 = tail call float @llvm.log2.f32(float %59)
  %62 = select i1 %60, float %61, float 0.000000e+00
  %63 = fmul contract float %62, %59
  %64 = fadd contract float %31, %63
  %65 = add nuw nsw i32 %30, 1
  %66 = icmp eq i32 %65, %0
  br i1 %66, label %33, label %29, !llvm.loop !13

67:                                               ; preds = %32, %67
  %68 = phi i32 [ %126, %67 ], [ 0, %32 ]
  %69 = phi float [ %125, %67 ], [ 0.000000e+00, %32 ]
  %70 = phi i32 [ %127, %67 ], [ 0, %32 ]
  %71 = mul nsw i32 %68, %0
  %72 = add nsw i32 %71, %30
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %20, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fadd contract float %69, %75
  %77 = or i32 %68, 1
  %78 = mul nsw i32 %77, %0
  %79 = add nsw i32 %78, %30
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %20, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fadd contract float %76, %82
  %84 = or i32 %68, 2
  %85 = mul nsw i32 %84, %0
  %86 = add nsw i32 %85, %30
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %20, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fadd contract float %83, %89
  %91 = or i32 %68, 3
  %92 = mul nsw i32 %91, %0
  %93 = add nsw i32 %92, %30
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %20, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fadd contract float %90, %96
  %98 = or i32 %68, 4
  %99 = mul nsw i32 %98, %0
  %100 = add nsw i32 %99, %30
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %20, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = fadd contract float %97, %103
  %105 = or i32 %68, 5
  %106 = mul nsw i32 %105, %0
  %107 = add nsw i32 %106, %30
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %20, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = fadd contract float %104, %110
  %112 = or i32 %68, 6
  %113 = mul nsw i32 %112, %0
  %114 = add nsw i32 %113, %30
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %20, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fadd contract float %111, %117
  %119 = or i32 %68, 7
  %120 = mul nsw i32 %119, %0
  %121 = add nsw i32 %120, %30
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %20, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = fadd contract float %118, %124
  %126 = add nuw nsw i32 %68, 8
  %127 = add i32 %70, 8
  %128 = icmp eq i32 %127, %27
  br i1 %128, label %38, label %67, !llvm.loop !15

129:                                              ; preds = %6, %33
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
