; ModuleID = '../data/hip_kernels/2625/0/main.cu'
source_filename = "../data/hip_kernels/2625/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13ConvMatKernelPhS_jjiPf(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = mul i32 %15, %2
  %25 = add i32 %24, %23
  %26 = mul i32 %3, %2
  %27 = icmp ult i32 %25, %26
  br i1 %27, label %28, label %113

28:                                               ; preds = %6
  %29 = icmp eq i32 %15, 0
  %30 = add i32 %3, -1
  %31 = icmp eq i32 %15, %30
  %32 = icmp eq i32 %23, 0
  %33 = add i32 %2, -1
  %34 = icmp eq i32 %23, %33
  br label %35

35:                                               ; preds = %28, %91
  %36 = phi i32 [ -1, %28 ], [ %95, %91 ]
  %37 = phi float [ 0.000000e+00, %28 ], [ %94, %91 ]
  %38 = phi float [ 0.000000e+00, %28 ], [ %93, %91 ]
  %39 = phi float [ 0.000000e+00, %28 ], [ %92, %91 ]
  %40 = icmp eq i32 %36, -1
  %41 = select i1 %29, i1 %40, i1 false
  br i1 %41, label %45, label %42

42:                                               ; preds = %35
  %43 = icmp sgt i32 %36, 0
  %44 = select i1 %31, i1 %43, i1 false
  br i1 %44, label %97, label %45

45:                                               ; preds = %35, %42
  %46 = phi i32 [ %36, %42 ], [ 0, %35 ]
  %47 = add nsw i32 %46, %15
  %48 = mul i32 %47, %2
  %49 = add i32 %48, %23
  %50 = mul i32 %46, 3
  %51 = add i32 %50, 4
  br label %52

52:                                               ; preds = %45, %62
  %53 = phi i32 [ -1, %45 ], [ %89, %62 ]
  %54 = phi float [ %37, %45 ], [ %88, %62 ]
  %55 = phi float [ %38, %45 ], [ %81, %62 ]
  %56 = phi float [ %39, %45 ], [ %74, %62 ]
  %57 = icmp eq i32 %53, -1
  %58 = select i1 %32, i1 %57, i1 false
  %59 = select i1 %58, i32 0, i32 %53
  %60 = icmp eq i32 %59, 1
  %61 = select i1 %34, i1 %60, i1 false
  br i1 %61, label %91, label %62

62:                                               ; preds = %52
  %63 = add i32 %49, %59
  %64 = mul i32 %63, 3
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %65
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !7, !amdgpu.noclobber !5
  %68 = uitofp i8 %67 to float
  %69 = add i32 %51, %59
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %5, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !10, !amdgpu.noclobber !5
  %73 = fmul contract float %72, %68
  %74 = fadd contract float %56, %73
  %75 = add i32 %64, 1
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %76
  %78 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !7, !amdgpu.noclobber !5
  %79 = uitofp i8 %78 to float
  %80 = fmul contract float %72, %79
  %81 = fadd contract float %55, %80
  %82 = add i32 %64, 2
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %83
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !7, !amdgpu.noclobber !5
  %86 = uitofp i8 %85 to float
  %87 = fmul contract float %72, %86
  %88 = fadd contract float %54, %87
  %89 = add nsw i32 %59, 1
  %90 = icmp slt i32 %59, 1
  br i1 %90, label %52, label %91, !llvm.loop !12

91:                                               ; preds = %62, %52
  %92 = phi float [ %74, %62 ], [ %56, %52 ]
  %93 = phi float [ %81, %62 ], [ %55, %52 ]
  %94 = phi float [ %88, %62 ], [ %54, %52 ]
  %95 = add nsw i32 %46, 1
  %96 = icmp slt i32 %46, 1
  br i1 %96, label %35, label %97, !llvm.loop !14

97:                                               ; preds = %42, %91
  %98 = phi float [ %39, %42 ], [ %92, %91 ]
  %99 = phi float [ %38, %42 ], [ %93, %91 ]
  %100 = phi float [ %37, %42 ], [ %94, %91 ]
  %101 = fptoui float %98 to i8
  %102 = mul i32 %25, 3
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %103
  store i8 %101, i8 addrspace(1)* %104, align 1, !tbaa !7
  %105 = fptoui float %99 to i8
  %106 = add i32 %102, 1
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %107
  store i8 %105, i8 addrspace(1)* %108, align 1, !tbaa !7
  %109 = fptoui float %100 to i8
  %110 = add i32 %102, 2
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %111
  store i8 %109, i8 addrspace(1)* %112, align 1, !tbaa !7
  br label %113

113:                                              ; preds = %97, %6
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
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
