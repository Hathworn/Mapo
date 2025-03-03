; ModuleID = '../data/hip_kernels/2305/14/main.cu'
source_filename = "../data/hip_kernels/2305/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19ReduceHKernelSimplePKhPfii(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %115

15:                                               ; preds = %4
  %16 = icmp sgt i32 %3, 0
  br i1 %16, label %17, label %41

17:                                               ; preds = %15
  %18 = and i32 %3, 7
  %19 = icmp ult i32 %3, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = and i32 %3, -8
  br label %45

22:                                               ; preds = %45, %17
  %23 = phi float [ undef, %17 ], [ %111, %45 ]
  %24 = phi i32 [ 0, %17 ], [ %112, %45 ]
  %25 = phi float [ 0.000000e+00, %17 ], [ %111, %45 ]
  %26 = icmp eq i32 %18, 0
  br i1 %26, label %41, label %27

27:                                               ; preds = %22, %27
  %28 = phi i32 [ %38, %27 ], [ %24, %22 ]
  %29 = phi float [ %37, %27 ], [ %25, %22 ]
  %30 = phi i32 [ %39, %27 ], [ 0, %22 ]
  %31 = mul nsw i32 %28, %2
  %32 = add nsw i32 %31, %13
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !7, !amdgpu.noclobber !5
  %36 = uitofp i8 %35 to float
  %37 = fadd contract float %29, %36
  %38 = add nuw nsw i32 %28, 1
  %39 = add i32 %30, 1
  %40 = icmp eq i32 %39, %18
  br i1 %40, label %41, label %27, !llvm.loop !10

41:                                               ; preds = %22, %27, %15
  %42 = phi float [ 0.000000e+00, %15 ], [ %23, %22 ], [ %37, %27 ]
  %43 = sext i32 %13 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %42, float addrspace(1)* %44, align 4, !tbaa !12
  br label %115

45:                                               ; preds = %45, %20
  %46 = phi i32 [ 0, %20 ], [ %112, %45 ]
  %47 = phi float [ 0.000000e+00, %20 ], [ %111, %45 ]
  %48 = phi i32 [ 0, %20 ], [ %113, %45 ]
  %49 = mul nsw i32 %46, %2
  %50 = add nsw i32 %49, %13
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %51
  %53 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !7, !amdgpu.noclobber !5
  %54 = uitofp i8 %53 to float
  %55 = fadd contract float %47, %54
  %56 = or i32 %46, 1
  %57 = mul nsw i32 %56, %2
  %58 = add nsw i32 %57, %13
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7, !amdgpu.noclobber !5
  %62 = uitofp i8 %61 to float
  %63 = fadd contract float %55, %62
  %64 = or i32 %46, 2
  %65 = mul nsw i32 %64, %2
  %66 = add nsw i32 %65, %13
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %67
  %69 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !7, !amdgpu.noclobber !5
  %70 = uitofp i8 %69 to float
  %71 = fadd contract float %63, %70
  %72 = or i32 %46, 3
  %73 = mul nsw i32 %72, %2
  %74 = add nsw i32 %73, %13
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %75
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !7, !amdgpu.noclobber !5
  %78 = uitofp i8 %77 to float
  %79 = fadd contract float %71, %78
  %80 = or i32 %46, 4
  %81 = mul nsw i32 %80, %2
  %82 = add nsw i32 %81, %13
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %83
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !7, !amdgpu.noclobber !5
  %86 = uitofp i8 %85 to float
  %87 = fadd contract float %79, %86
  %88 = or i32 %46, 5
  %89 = mul nsw i32 %88, %2
  %90 = add nsw i32 %89, %13
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %91
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !7, !amdgpu.noclobber !5
  %94 = uitofp i8 %93 to float
  %95 = fadd contract float %87, %94
  %96 = or i32 %46, 6
  %97 = mul nsw i32 %96, %2
  %98 = add nsw i32 %97, %13
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %99
  %101 = load i8, i8 addrspace(1)* %100, align 1, !tbaa !7, !amdgpu.noclobber !5
  %102 = uitofp i8 %101 to float
  %103 = fadd contract float %95, %102
  %104 = or i32 %46, 7
  %105 = mul nsw i32 %104, %2
  %106 = add nsw i32 %105, %13
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %107
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !7, !amdgpu.noclobber !5
  %110 = uitofp i8 %109 to float
  %111 = fadd contract float %103, %110
  %112 = add nuw nsw i32 %46, 8
  %113 = add i32 %48, 8
  %114 = icmp eq i32 %113, %21
  br i1 %114, label %22, label %45, !llvm.loop !14

115:                                              ; preds = %41, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !8, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
