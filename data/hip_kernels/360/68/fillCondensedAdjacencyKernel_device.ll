; ModuleID = '../data/hip_kernels/360/68/main.cu'
source_filename = "../data/hip_kernels/360/68/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28fillCondensedAdjacencyKerneliPiS_S_S_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %124

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %18
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = add nsw i32 %15, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = sub nsw i32 %29, %25
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %124

32:                                               ; preds = %17
  %33 = xor i32 %25, -1
  %34 = add i32 %29, %33
  %35 = and i32 %30, 7
  %36 = icmp ult i32 %34, 7
  br i1 %36, label %108, label %37

37:                                               ; preds = %32
  %38 = and i32 %30, -8
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi i32 [ 0, %37 ], [ %105, %39 ]
  %41 = phi i32 [ 0, %37 ], [ %106, %39 ]
  %42 = add nsw i32 %40, %23
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7
  %46 = add nsw i32 %40, %25
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  store i32 %45, i32 addrspace(1)* %48, align 4, !tbaa !7
  %49 = or i32 %40, 1
  %50 = add nsw i32 %49, %23
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7
  %54 = add nsw i32 %49, %25
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %55
  store i32 %53, i32 addrspace(1)* %56, align 4, !tbaa !7
  %57 = or i32 %40, 2
  %58 = add nsw i32 %57, %23
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7
  %62 = add nsw i32 %57, %25
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %63
  store i32 %61, i32 addrspace(1)* %64, align 4, !tbaa !7
  %65 = or i32 %40, 3
  %66 = add nsw i32 %65, %23
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = add nsw i32 %65, %25
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %71
  store i32 %69, i32 addrspace(1)* %72, align 4, !tbaa !7
  %73 = or i32 %40, 4
  %74 = add nsw i32 %73, %23
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !7
  %78 = add nsw i32 %73, %25
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %79
  store i32 %77, i32 addrspace(1)* %80, align 4, !tbaa !7
  %81 = or i32 %40, 5
  %82 = add nsw i32 %81, %23
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = add nsw i32 %81, %25
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %87
  store i32 %85, i32 addrspace(1)* %88, align 4, !tbaa !7
  %89 = or i32 %40, 6
  %90 = add nsw i32 %89, %23
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7
  %94 = add nsw i32 %89, %25
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %95
  store i32 %93, i32 addrspace(1)* %96, align 4, !tbaa !7
  %97 = or i32 %40, 7
  %98 = add nsw i32 %97, %23
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7
  %102 = add nsw i32 %97, %25
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %103
  store i32 %101, i32 addrspace(1)* %104, align 4, !tbaa !7
  %105 = add nuw nsw i32 %40, 8
  %106 = add i32 %41, 8
  %107 = icmp eq i32 %106, %38
  br i1 %107, label %108, label %39, !llvm.loop !11

108:                                              ; preds = %39, %32
  %109 = phi i32 [ 0, %32 ], [ %105, %39 ]
  %110 = icmp eq i32 %35, 0
  br i1 %110, label %124, label %111

111:                                              ; preds = %108, %111
  %112 = phi i32 [ %121, %111 ], [ %109, %108 ]
  %113 = phi i32 [ %122, %111 ], [ 0, %108 ]
  %114 = add nsw i32 %112, %23
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !7
  %118 = add nsw i32 %112, %25
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %119
  store i32 %117, i32 addrspace(1)* %120, align 4, !tbaa !7
  %121 = add nuw nsw i32 %112, 1
  %122 = add i32 %113, 1
  %123 = icmp eq i32 %122, %35
  br i1 %123, label %124, label %111, !llvm.loop !13

124:                                              ; preds = %108, %111, %17, %6
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
