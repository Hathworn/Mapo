; ModuleID = '../data/hip_kernels/360/61/main.cu'
source_filename = "../data/hip_kernels/360/61/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19allocateNodesKerneliPiS_S_S_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture %5) local_unnamed_addr #0 {
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
  br i1 %16, label %17, label %123

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %123

22:                                               ; preds = %17
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = add nsw i32 %15, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = icmp slt i32 %24, %28
  br i1 %29, label %81, label %30

30:                                               ; preds = %117, %22
  %31 = phi <10 x i32> [ <i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1>, %22 ], [ %118, %117 ]
  %32 = phi <10 x i32> [ zeroinitializer, %22 ], [ %119, %117 ]
  %33 = extractelement <10 x i32> %31, i64 0
  %34 = extractelement <10 x i32> %32, i64 0
  %35 = extractelement <10 x i32> %32, i64 1
  %36 = icmp sgt i32 %35, %34
  %37 = extractelement <10 x i32> %31, i64 1
  %38 = select i1 %36, i32 %37, i32 %33
  %39 = tail call i32 @llvm.smax.i32(i32 %35, i32 %34)
  %40 = extractelement <10 x i32> %32, i64 2
  %41 = icmp sgt i32 %40, %39
  %42 = extractelement <10 x i32> %31, i64 2
  %43 = select i1 %41, i32 %42, i32 %38
  %44 = tail call i32 @llvm.smax.i32(i32 %40, i32 %39)
  %45 = extractelement <10 x i32> %32, i64 3
  %46 = icmp sgt i32 %45, %44
  %47 = extractelement <10 x i32> %31, i64 3
  %48 = select i1 %46, i32 %47, i32 %43
  %49 = tail call i32 @llvm.smax.i32(i32 %45, i32 %44)
  %50 = extractelement <10 x i32> %32, i64 4
  %51 = icmp sgt i32 %50, %49
  %52 = extractelement <10 x i32> %31, i64 4
  %53 = select i1 %51, i32 %52, i32 %48
  %54 = tail call i32 @llvm.smax.i32(i32 %50, i32 %49)
  %55 = extractelement <10 x i32> %32, i64 5
  %56 = icmp sgt i32 %55, %54
  %57 = extractelement <10 x i32> %31, i64 5
  %58 = select i1 %56, i32 %57, i32 %53
  %59 = tail call i32 @llvm.smax.i32(i32 %55, i32 %54)
  %60 = extractelement <10 x i32> %32, i64 6
  %61 = icmp sgt i32 %60, %59
  %62 = extractelement <10 x i32> %31, i64 6
  %63 = select i1 %61, i32 %62, i32 %58
  %64 = tail call i32 @llvm.smax.i32(i32 %60, i32 %59)
  %65 = extractelement <10 x i32> %32, i64 7
  %66 = icmp sgt i32 %65, %64
  %67 = extractelement <10 x i32> %31, i64 7
  %68 = select i1 %66, i32 %67, i32 %63
  %69 = tail call i32 @llvm.smax.i32(i32 %65, i32 %64)
  %70 = extractelement <10 x i32> %32, i64 8
  %71 = icmp sgt i32 %70, %69
  %72 = extractelement <10 x i32> %31, i64 8
  %73 = select i1 %71, i32 %72, i32 %68
  %74 = tail call i32 @llvm.smax.i32(i32 %70, i32 %69)
  %75 = extractelement <10 x i32> %32, i64 9
  %76 = icmp sgt i32 %75, %74
  %77 = extractelement <10 x i32> %31, i64 9
  %78 = select i1 %76, i32 %77, i32 %73
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %18
  store i32 %78, i32 addrspace(1)* %79, align 4, !tbaa !7
  %80 = icmp eq i32 %78, -1
  br i1 %80, label %123, label %122

81:                                               ; preds = %22, %117
  %82 = phi i32 [ %120, %117 ], [ %24, %22 ]
  %83 = phi <10 x i32> [ %119, %117 ], [ zeroinitializer, %22 ]
  %84 = phi <10 x i32> [ %118, %117 ], [ <i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1>, %22 ]
  %85 = sext i32 %82 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = icmp eq i32 %90, -1
  br i1 %91, label %117, label %92

92:                                               ; preds = %81, %109
  %93 = phi i32 [ %113, %109 ], [ 0, %81 ]
  %94 = phi i32 [ %112, %109 ], [ %90, %81 ]
  %95 = phi <10 x i32> [ %111, %109 ], [ %83, %81 ]
  %96 = phi <10 x i32> [ %110, %109 ], [ %84, %81 ]
  %97 = extractelement <10 x i32> %96, i32 %93
  %98 = icmp eq i32 %97, -1
  br i1 %98, label %99, label %102

99:                                               ; preds = %92
  %100 = insertelement <10 x i32> %96, i32 %94, i32 %93
  %101 = insertelement <10 x i32> %95, i32 1, i32 %93
  br label %109

102:                                              ; preds = %92
  %103 = icmp eq i32 %97, %94
  %104 = extractelement <10 x i32> %95, i32 %93
  %105 = add nsw i32 %104, 1
  %106 = insertelement <10 x i32> %95, i32 %105, i32 %93
  %107 = select i1 %103, <10 x i32> %106, <10 x i32> %95
  %108 = select i1 %103, i32 -1, i32 %94
  br label %109

109:                                              ; preds = %102, %99
  %110 = phi <10 x i32> [ %100, %99 ], [ %96, %102 ]
  %111 = phi <10 x i32> [ %101, %99 ], [ %107, %102 ]
  %112 = phi i32 [ %94, %99 ], [ %108, %102 ]
  %113 = add nuw nsw i32 %93, 1
  %114 = icmp ult i32 %93, 9
  %115 = icmp ne i32 %112, -1
  %116 = select i1 %114, i1 %115, i1 false
  br i1 %116, label %92, label %117, !llvm.loop !11

117:                                              ; preds = %109, %81
  %118 = phi <10 x i32> [ %84, %81 ], [ %110, %109 ]
  %119 = phi <10 x i32> [ %83, %81 ], [ %111, %109 ]
  %120 = add nsw i32 %82, 1
  %121 = icmp slt i32 %120, %28
  br i1 %121, label %81, label %30, !llvm.loop !13

122:                                              ; preds = %30
  store i32 1, i32 addrspace(1)* %19, align 4, !tbaa !7
  br label %123

123:                                              ; preds = %30, %122, %17, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!13 = distinct !{!13, !12}
