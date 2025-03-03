; ModuleID = '../data/hip_kernels/830/0/main.cu'
source_filename = "../data/hip_kernels/830/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17vector_max_kernelPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = mul i32 %17, %18
  %20 = add i32 %19, %4
  %21 = mul i32 %20, %12
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = icmp eq i32 %22, 0
  br i1 %24, label %25, label %125

25:                                               ; preds = %3
  %26 = add nsw i32 %23, 256
  %27 = icmp sgt i32 %26, %2
  %28 = sub nsw i32 %2, %23
  %29 = select i1 %27, i32 %28, i32 256
  %30 = sext i32 %23 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !14
  %33 = icmp sgt i32 %29, 1
  br i1 %33, label %34, label %59

34:                                               ; preds = %25
  %35 = add i32 %29, -1
  %36 = add i32 %29, -2
  %37 = and i32 %35, 7
  %38 = icmp ult i32 %36, 7
  br i1 %38, label %41, label %39

39:                                               ; preds = %34
  %40 = and i32 %35, -8
  br label %63

41:                                               ; preds = %63, %34
  %42 = phi float [ undef, %34 ], [ %121, %63 ]
  %43 = phi i32 [ 1, %34 ], [ %122, %63 ]
  %44 = phi float [ %32, %34 ], [ %121, %63 ]
  %45 = icmp eq i32 %37, 0
  br i1 %45, label %59, label %46

46:                                               ; preds = %41, %46
  %47 = phi i32 [ %56, %46 ], [ %43, %41 ]
  %48 = phi float [ %55, %46 ], [ %44, %41 ]
  %49 = phi i32 [ %57, %46 ], [ 0, %41 ]
  %50 = add nsw i32 %47, %23
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !14
  %54 = fcmp contract olt float %48, %53
  %55 = select i1 %54, float %53, float %48
  %56 = add nuw nsw i32 %47, 1
  %57 = add i32 %49, 1
  %58 = icmp eq i32 %57, %37
  br i1 %58, label %59, label %46, !llvm.loop !20

59:                                               ; preds = %41, %46, %25
  %60 = phi float [ %32, %25 ], [ %42, %41 ], [ %55, %46 ]
  %61 = sext i32 %20 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  store float %60, float addrspace(1)* %62, align 4, !tbaa !16
  br label %125

63:                                               ; preds = %63, %39
  %64 = phi i32 [ 1, %39 ], [ %122, %63 ]
  %65 = phi float [ %32, %39 ], [ %121, %63 ]
  %66 = phi i32 [ 0, %39 ], [ %123, %63 ]
  %67 = add nsw i32 %64, %23
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16, !amdgpu.noclobber !14
  %71 = fcmp contract olt float %65, %70
  %72 = select i1 %71, float %70, float %65
  %73 = add nuw nsw i32 %64, 1
  %74 = add nsw i32 %73, %23
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16, !amdgpu.noclobber !14
  %78 = fcmp contract olt float %72, %77
  %79 = select i1 %78, float %77, float %72
  %80 = add nuw nsw i32 %64, 2
  %81 = add nsw i32 %80, %23
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16, !amdgpu.noclobber !14
  %85 = fcmp contract olt float %79, %84
  %86 = select i1 %85, float %84, float %79
  %87 = add nuw nsw i32 %64, 3
  %88 = add nsw i32 %87, %23
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16, !amdgpu.noclobber !14
  %92 = fcmp contract olt float %86, %91
  %93 = select i1 %92, float %91, float %86
  %94 = add nuw nsw i32 %64, 4
  %95 = add nsw i32 %94, %23
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16, !amdgpu.noclobber !14
  %99 = fcmp contract olt float %93, %98
  %100 = select i1 %99, float %98, float %93
  %101 = add nuw nsw i32 %64, 5
  %102 = add nsw i32 %101, %23
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16, !amdgpu.noclobber !14
  %106 = fcmp contract olt float %100, %105
  %107 = select i1 %106, float %105, float %100
  %108 = add nuw nsw i32 %64, 6
  %109 = add nsw i32 %108, %23
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16, !amdgpu.noclobber !14
  %113 = fcmp contract olt float %107, %112
  %114 = select i1 %113, float %112, float %107
  %115 = add nuw nsw i32 %64, 7
  %116 = add nsw i32 %115, %23
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16, !amdgpu.noclobber !14
  %120 = fcmp contract olt float %114, %119
  %121 = select i1 %120, float %119, float %114
  %122 = add nuw nsw i32 %64, 8
  %123 = add i32 %66, 8
  %124 = icmp eq i32 %123, %40
  br i1 %124, label %41, label %63, !llvm.loop !22

125:                                              ; preds = %59, %3
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
