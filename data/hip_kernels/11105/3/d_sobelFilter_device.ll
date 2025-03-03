; ModuleID = '../data/hip_kernels/11105/3/main.cu'
source_filename = "../data/hip_kernels/11105/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13d_sobelFilterPhS_iiiPc(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i8 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = sdiv i32 %4, 2
  %25 = sub nsw i32 %15, %24
  %26 = sub nsw i32 %23, %24
  %27 = icmp slt i32 %15, %3
  %28 = icmp slt i32 %23, %2
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %132

30:                                               ; preds = %6
  %31 = icmp sgt i32 %4, 0
  br i1 %31, label %32, label %46

32:                                               ; preds = %30
  %33 = and i32 %4, 1
  %34 = icmp eq i32 %4, 1
  %35 = and i32 %4, -2
  %36 = icmp eq i32 %33, 0
  br label %37

37:                                               ; preds = %32, %80
  %38 = phi i32 [ %82, %80 ], [ 0, %32 ]
  %39 = phi i32 [ %81, %80 ], [ 0, %32 ]
  %40 = add nsw i32 %38, %25
  %41 = icmp sgt i32 %40, -1
  %42 = icmp slt i32 %40, %3
  %43 = select i1 %41, i1 %42, i1 false
  %44 = mul nsw i32 %40, %2
  %45 = mul nsw i32 %38, %4
  br i1 %34, label %55, label %84

46:                                               ; preds = %80, %30
  %47 = phi i32 [ 0, %30 ], [ %81, %80 ]
  %48 = tail call i32 @llvm.smin.i32(i32 %47, i32 255)
  %49 = tail call i32 @llvm.smax.i32(i32 %48, i32 0)
  %50 = trunc i32 %49 to i8
  %51 = mul nsw i32 %15, %2
  %52 = add nsw i32 %51, %23
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %53
  store i8 %50, i8 addrspace(1)* %54, align 1, !tbaa !7
  br label %132

55:                                               ; preds = %127, %37
  %56 = phi i32 [ undef, %37 ], [ %128, %127 ]
  %57 = phi i32 [ 0, %37 ], [ %129, %127 ]
  %58 = phi i32 [ %39, %37 ], [ %128, %127 ]
  %59 = xor i1 %43, true
  %60 = select i1 %36, i1 true, i1 %59
  %61 = select i1 %36, i32 %56, i32 %58
  br i1 %60, label %80, label %62

62:                                               ; preds = %55
  %63 = add nsw i32 %57, %26
  %64 = icmp sgt i32 %63, -1
  %65 = icmp slt i32 %63, %2
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %80

67:                                               ; preds = %62
  %68 = add nsw i32 %63, %44
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !7, !amdgpu.noclobber !5
  %72 = zext i8 %71 to i32
  %73 = add nsw i32 %57, %45
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !7, !amdgpu.noclobber !5
  %77 = sext i8 %76 to i32
  %78 = mul nsw i32 %77, %72
  %79 = add nsw i32 %78, %58
  br label %80

80:                                               ; preds = %55, %62, %67
  %81 = phi i32 [ %61, %55 ], [ %79, %67 ], [ %58, %62 ]
  %82 = add nuw nsw i32 %38, 1
  %83 = icmp eq i32 %82, %4
  br i1 %83, label %46, label %37, !llvm.loop !10

84:                                               ; preds = %37, %127
  %85 = phi i32 [ %129, %127 ], [ 0, %37 ]
  %86 = phi i32 [ %128, %127 ], [ %39, %37 ]
  %87 = phi i32 [ %130, %127 ], [ 0, %37 ]
  br i1 %43, label %88, label %106

88:                                               ; preds = %84
  %89 = add nsw i32 %85, %26
  %90 = icmp sgt i32 %89, -1
  %91 = icmp slt i32 %89, %2
  %92 = select i1 %90, i1 %91, i1 false
  br i1 %92, label %93, label %106

93:                                               ; preds = %88
  %94 = add nsw i32 %89, %44
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %95
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !7, !amdgpu.noclobber !5
  %98 = zext i8 %97 to i32
  %99 = add nsw i32 %85, %45
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %100
  %102 = load i8, i8 addrspace(1)* %101, align 1, !tbaa !7, !amdgpu.noclobber !5
  %103 = sext i8 %102 to i32
  %104 = mul nsw i32 %103, %98
  %105 = add nsw i32 %104, %86
  br label %106

106:                                              ; preds = %84, %88, %93
  %107 = phi i32 [ %105, %93 ], [ %86, %88 ], [ %86, %84 ]
  %108 = or i32 %85, 1
  br i1 %43, label %109, label %127

109:                                              ; preds = %106
  %110 = add nsw i32 %108, %26
  %111 = icmp sgt i32 %110, -1
  %112 = icmp slt i32 %110, %2
  %113 = select i1 %111, i1 %112, i1 false
  br i1 %113, label %114, label %127

114:                                              ; preds = %109
  %115 = add nsw i32 %110, %44
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %116
  %118 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !7, !amdgpu.noclobber !5
  %119 = zext i8 %118 to i32
  %120 = add nsw i32 %108, %45
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %121
  %123 = load i8, i8 addrspace(1)* %122, align 1, !tbaa !7, !amdgpu.noclobber !5
  %124 = sext i8 %123 to i32
  %125 = mul nsw i32 %124, %119
  %126 = add nsw i32 %125, %107
  br label %127

127:                                              ; preds = %114, %109, %106
  %128 = phi i32 [ %126, %114 ], [ %107, %109 ], [ %107, %106 ]
  %129 = add nuw nsw i32 %85, 2
  %130 = add i32 %87, 2
  %131 = icmp eq i32 %130, %35
  br i1 %131, label %55, label %84, !llvm.loop !12

132:                                              ; preds = %46, %6
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
