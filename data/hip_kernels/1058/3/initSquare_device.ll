; ModuleID = '../data/hip_kernels/1058/3/main.cu'
source_filename = "../data/hip_kernels/1058/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10initSquarePfS_fii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readnone %1, float %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = icmp ult i32 %14, %3
  br i1 %15, label %16, label %20

16:                                               ; preds = %5
  %17 = sdiv i32 %3, 3
  %18 = shl nsw i32 %3, 1
  %19 = sdiv i32 %18, 3
  br label %29

20:                                               ; preds = %29, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp eq i32 %14, 0
  %22 = icmp sgt i32 %4, 0
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %126

24:                                               ; preds = %20
  %25 = and i32 %4, 3
  %26 = icmp ult i32 %4, 4
  br i1 %26, label %104, label %27

27:                                               ; preds = %24
  %28 = and i32 %4, -4
  br label %43

29:                                               ; preds = %16, %29
  %30 = phi i32 [ %14, %16 ], [ %41, %29 ]
  %31 = phi i32 [ 0, %16 ], [ %39, %29 ]
  %32 = icmp sgt i32 %30, %17
  %33 = icmp slt i32 %30, %19
  %34 = select i1 %32, i1 %33, i1 false
  %35 = add nsw i32 %30, %4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = select i1 %34, float 1.500000e+00, float 5.000000e-01
  store float %38, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = add nuw nsw i32 %31, 1
  %40 = mul i32 %39, %11
  %41 = add i32 %40, %14
  %42 = icmp ult i32 %41, %3
  br i1 %42, label %29, label %20, !llvm.loop !11

43:                                               ; preds = %43, %27
  %44 = phi i32 [ 0, %27 ], [ %101, %43 ]
  %45 = phi i32 [ 0, %27 ], [ %102, %43 ]
  %46 = add nsw i32 %44, %3
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = zext i32 %44 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  store float %49, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = add i32 %44, %4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = add i32 %52, %3
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  store float %55, float addrspace(1)* %58, align 4, !tbaa !7
  %59 = or i32 %44, 1
  %60 = add nsw i32 %59, %3
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = zext i32 %59 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  store float %63, float addrspace(1)* %65, align 4, !tbaa !7
  %66 = add i32 %59, %4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = add i32 %66, %3
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  store float %69, float addrspace(1)* %72, align 4, !tbaa !7
  %73 = or i32 %44, 2
  %74 = add nsw i32 %73, %3
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = zext i32 %73 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  store float %77, float addrspace(1)* %79, align 4, !tbaa !7
  %80 = add i32 %73, %4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = add i32 %80, %3
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  store float %83, float addrspace(1)* %86, align 4, !tbaa !7
  %87 = or i32 %44, 3
  %88 = add nsw i32 %87, %3
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = zext i32 %87 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  store float %91, float addrspace(1)* %93, align 4, !tbaa !7
  %94 = add i32 %87, %4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = add i32 %94, %3
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  store float %97, float addrspace(1)* %100, align 4, !tbaa !7
  %101 = add nuw nsw i32 %44, 4
  %102 = add i32 %45, 4
  %103 = icmp eq i32 %102, %28
  br i1 %103, label %104, label %43, !llvm.loop !13

104:                                              ; preds = %43, %24
  %105 = phi i32 [ 0, %24 ], [ %101, %43 ]
  %106 = icmp eq i32 %25, 0
  br i1 %106, label %126, label %107

107:                                              ; preds = %104, %107
  %108 = phi i32 [ %123, %107 ], [ %105, %104 ]
  %109 = phi i32 [ %124, %107 ], [ 0, %104 ]
  %110 = add nsw i32 %108, %3
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = zext i32 %108 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  store float %113, float addrspace(1)* %115, align 4, !tbaa !7
  %116 = add i32 %108, %4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = add i32 %116, %3
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  store float %119, float addrspace(1)* %122, align 4, !tbaa !7
  %123 = add nuw nsw i32 %108, 1
  %124 = add i32 %109, 1
  %125 = icmp eq i32 %124, %25
  br i1 %125, label %126, label %107, !llvm.loop !14

126:                                              ; preds = %104, %107, %20
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
