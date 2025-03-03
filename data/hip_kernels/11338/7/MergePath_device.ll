; ModuleID = '../data/hip_kernels/11338/7/main.cu'
source_filename = "../data/hip_kernels/11338/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9MergePathPiS_S_S_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %6
  store i32 0, i32 addrspace(1)* %3, align 4, !tbaa !7
  store i32 0, i32 addrspace(1)* %4, align 4, !tbaa !7
  br label %15

15:                                               ; preds = %14, %6
  %16 = shl nuw nsw i32 %12, 1
  %17 = mul i32 %16, %5
  %18 = sdiv i32 %17, %11
  %19 = add nsw i32 %5, -1
  %20 = sub nsw i32 %18, %19
  %21 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %22 = tail call i32 @llvm.smin.i32(i32 %19, i32 %18)
  %23 = icmp slt i32 %20, 1
  %24 = xor i32 %21, -1
  %25 = add i32 %24, %5
  %26 = select i1 %23, i32 %22, i32 %25
  %27 = icmp slt i32 %26, 0
  %28 = select i1 %27, i1 true, i1 %13
  br i1 %28, label %74, label %29

29:                                               ; preds = %15
  %30 = zext i32 %12 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %30
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %30
  br label %33

33:                                               ; preds = %29, %68
  %34 = phi i32 [ %26, %29 ], [ %70, %68 ]
  %35 = phi i32 [ 0, %29 ], [ %69, %68 ]
  %36 = sub nsw i32 %34, %35
  %37 = sdiv i32 %36, 2
  %38 = add nsw i32 %37, %35
  %39 = sub nsw i32 %22, %38
  %40 = add nsw i32 %38, %21
  %41 = sext i32 %39 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = sext i32 %40 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %47 = icmp sgt i32 %43, %46
  br i1 %47, label %48, label %50

48:                                               ; preds = %33
  %49 = add nsw i32 %38, 1
  br label %68

50:                                               ; preds = %33
  %51 = icmp eq i32 %40, 0
  br i1 %51, label %52, label %54

52:                                               ; preds = %50
  %53 = add nsw i32 %39, 1
  store i32 %53, i32 addrspace(1)* %31, align 4, !tbaa !7
  store i32 0, i32 addrspace(1)* %32, align 4, !tbaa !7
  br label %68

54:                                               ; preds = %50
  %55 = icmp eq i32 %39, %19
  br i1 %55, label %56, label %57

56:                                               ; preds = %54
  store i32 %5, i32 addrspace(1)* %31, align 4, !tbaa !7
  store i32 %40, i32 addrspace(1)* %32, align 4, !tbaa !7
  br label %68

57:                                               ; preds = %54
  %58 = add nsw i32 %39, 1
  %59 = add nsw i32 %40, -1
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7
  %63 = sext i32 %59 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7
  %66 = icmp sgt i32 %62, %65
  br i1 %66, label %67, label %68

67:                                               ; preds = %57
  store i32 %58, i32 addrspace(1)* %31, align 4, !tbaa !7
  store i32 %40, i32 addrspace(1)* %32, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %57, %52, %67, %56, %48
  %69 = phi i32 [ %35, %52 ], [ %35, %56 ], [ %35, %67 ], [ %49, %48 ], [ %35, %57 ]
  %70 = phi i32 [ %34, %52 ], [ %34, %56 ], [ %34, %67 ], [ %34, %48 ], [ %38, %57 ]
  %71 = phi i1 [ true, %52 ], [ true, %56 ], [ true, %67 ], [ false, %48 ], [ false, %57 ]
  %72 = icmp slt i32 %70, %69
  %73 = or i1 %72, %71
  br i1 %73, label %74, label %33, !llvm.loop !11

74:                                               ; preds = %68, %15
  %75 = phi i32 [ 0, %15 ], [ %69, %68 ]
  %76 = phi i1 [ %13, %15 ], [ %71, %68 ]
  br i1 %76, label %83, label %77

77:                                               ; preds = %74
  %78 = add i32 %22, 1
  %79 = sub i32 %78, %75
  %80 = zext i32 %12 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %80
  store i32 %79, i32 addrspace(1)* %81, align 4, !tbaa !7
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %80
  store i32 %5, i32 addrspace(1)* %82, align 4, !tbaa !7
  br label %83

83:                                               ; preds = %77, %74
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = add nsw i32 %11, -1
  %85 = icmp eq i32 %12, %84
  br i1 %85, label %93, label %86

86:                                               ; preds = %83
  %87 = add nuw nsw i32 %12, 1
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %88
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7
  br label %93

93:                                               ; preds = %83, %86
  %94 = phi i32 [ %90, %86 ], [ %5, %83 ]
  %95 = phi i32 [ %92, %86 ], [ %5, %83 ]
  %96 = zext i32 %12 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %96
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7
  %101 = add nsw i32 %100, %98
  %102 = icmp slt i32 %98, %94
  %103 = icmp slt i32 %100, %95
  %104 = select i1 %102, i1 %103, i1 false
  br i1 %104, label %110, label %105

105:                                              ; preds = %110, %93
  %106 = phi i32 [ %98, %93 ], [ %125, %110 ]
  %107 = phi i32 [ %100, %93 ], [ %128, %110 ]
  %108 = phi i32 [ %101, %93 ], [ %129, %110 ]
  %109 = icmp slt i32 %106, %94
  br i1 %109, label %136, label %133

110:                                              ; preds = %93, %110
  %111 = phi i32 [ %129, %110 ], [ %101, %93 ]
  %112 = phi i32 [ %128, %110 ], [ %100, %93 ]
  %113 = phi i32 [ %125, %110 ], [ %98, %93 ]
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7
  %117 = sext i32 %112 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %117
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !7
  %120 = icmp sle i32 %116, %119
  %121 = sext i32 %111 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %121
  %123 = tail call i32 @llvm.smin.i32(i32 %116, i32 %119)
  %124 = zext i1 %120 to i32
  %125 = add nsw i32 %113, %124
  %126 = xor i1 %120, true
  %127 = zext i1 %126 to i32
  %128 = add nsw i32 %112, %127
  store i32 %123, i32 addrspace(1)* %122, align 4, !tbaa !7
  %129 = add nsw i32 %111, 1
  %130 = icmp slt i32 %125, %94
  %131 = icmp slt i32 %128, %95
  %132 = select i1 %130, i1 %131, i1 false
  br i1 %132, label %110, label %105, !llvm.loop !13

133:                                              ; preds = %136, %105
  %134 = phi i32 [ %108, %105 ], [ %143, %136 ]
  %135 = icmp slt i32 %107, %95
  br i1 %135, label %147, label %158

136:                                              ; preds = %105, %136
  %137 = phi i32 [ %143, %136 ], [ %108, %105 ]
  %138 = phi i32 [ %139, %136 ], [ %106, %105 ]
  %139 = add nsw i32 %138, 1
  %140 = sext i32 %138 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !7
  %143 = add nsw i32 %137, 1
  %144 = sext i32 %137 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %144
  store i32 %142, i32 addrspace(1)* %145, align 4, !tbaa !7
  %146 = icmp slt i32 %139, %94
  br i1 %146, label %136, label %133, !llvm.loop !14

147:                                              ; preds = %133, %147
  %148 = phi i32 [ %154, %147 ], [ %134, %133 ]
  %149 = phi i32 [ %150, %147 ], [ %107, %133 ]
  %150 = add nsw i32 %149, 1
  %151 = sext i32 %149 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %151
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !7
  %154 = add nsw i32 %148, 1
  %155 = sext i32 %148 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %155
  store i32 %153, i32 addrspace(1)* %156, align 4, !tbaa !7
  %157 = icmp slt i32 %150, %95
  br i1 %157, label %147, label %158, !llvm.loop !15

158:                                              ; preds = %147, %133
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
