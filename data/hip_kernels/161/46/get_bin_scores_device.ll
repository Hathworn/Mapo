; ModuleID = '../data/hip_kernels/161/46/main.cu'
source_filename = "../data/hip_kernels/161/46/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14get_bin_scoresiiiPfiiS_iS_i(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, float addrspace(1)* nocapture %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %15
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %5
  br i1 %20, label %21, label %125

21:                                               ; preds = %10
  %22 = mul nsw i32 %19, %7
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %6, i64 %23
  %25 = icmp sgt i32 %4, 0
  br i1 %25, label %26, label %125

26:                                               ; preds = %21
  %27 = mul nsw i32 %19, %9
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %8, i64 %28
  %30 = icmp slt i32 %1, 2
  %31 = sext i32 %0 to i64
  br label %32

32:                                               ; preds = %26, %45
  %33 = phi i32 [ 0, %26 ], [ %46, %45 ]
  %34 = phi float addrspace(1)* [ %29, %26 ], [ %47, %45 ]
  %35 = zext i32 %33 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %24, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  %38 = tail call float @llvm.floor.f32(float %37)
  %39 = fptosi float %38 to i32
  %40 = add nsw i32 %39, %1
  %41 = tail call i32 @llvm.smin.i32(i32 %40, i32 %0)
  %42 = add nsw i32 %41, -1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %34, i64 %43
  store float 1.000000e+00, float addrspace(1)* %44, align 4, !tbaa !7
  br i1 %30, label %45, label %49

45:                                               ; preds = %53, %32
  %46 = add nuw nsw i32 %33, 1
  %47 = getelementptr inbounds float, float addrspace(1)* %34, i64 %31
  %48 = icmp eq i32 %46, %4
  br i1 %48, label %125, label %32, !llvm.loop !11

49:                                               ; preds = %32, %53
  %50 = phi i32 [ %54, %53 ], [ 2, %32 ]
  %51 = sub i32 %41, %50
  %52 = icmp slt i32 %51, %41
  br i1 %52, label %56, label %53

53:                                               ; preds = %119, %49
  %54 = add nuw i32 %50, 1
  %55 = icmp eq i32 %50, %1
  br i1 %55, label %45, label %49, !llvm.loop !13

56:                                               ; preds = %49, %119
  %57 = phi i32 [ %63, %119 ], [ %51, %49 ]
  %58 = add nsw i32 %57, %50
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fsub contract float %61, %37
  %63 = add nsw i32 %57, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %3, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fsub contract float %61, %66
  %68 = fcmp contract oeq float %62, %67
  %69 = fcmp contract une float %62, 0.000000e+00
  %70 = and i1 %69, %68
  %71 = icmp slt i32 %57, 0
  %72 = icmp sge i32 %57, %2
  %73 = select i1 %71, i1 true, i1 %72
  %74 = icmp slt i32 %58, 1
  %75 = select i1 %73, i1 true, i1 %74
  br i1 %75, label %98, label %76

76:                                               ; preds = %56
  %77 = add nsw i32 %58, -1
  %78 = zext i32 %57 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %3, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fsub contract float %37, %80
  %82 = zext i32 %77 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %3, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = fsub contract float %84, %80
  %86 = fcmp contract oeq float %81, %85
  %87 = fcmp contract une float %81, 0.000000e+00
  %88 = and i1 %87, %86
  br i1 %88, label %93, label %89

89:                                               ; preds = %76
  %90 = fcmp contract une float %85, 0.000000e+00
  br i1 %90, label %91, label %93

91:                                               ; preds = %89
  %92 = fdiv contract float %81, %85
  br label %93

93:                                               ; preds = %76, %89, %91
  %94 = phi float [ %92, %91 ], [ 0.000000e+00, %89 ], [ 1.000000e+00, %76 ]
  %95 = getelementptr inbounds float, float addrspace(1)* %34, i64 %78
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fmul contract float %94, %96
  br label %98

98:                                               ; preds = %56, %93
  %99 = phi float [ %97, %93 ], [ 0.000000e+00, %56 ]
  %100 = icmp sgt i32 %57, -2
  %101 = icmp slt i32 %63, %0
  %102 = select i1 %100, i1 %101, i1 false
  %103 = icmp slt i32 %63, %2
  %104 = select i1 %102, i1 %103, i1 false
  %105 = icmp sgt i32 %58, -1
  %106 = select i1 %104, i1 %105, i1 false
  %107 = icmp slt i32 %58, %2
  %108 = select i1 %106, i1 %107, i1 false
  br i1 %108, label %109, label %119

109:                                              ; preds = %98
  br i1 %70, label %114, label %110

110:                                              ; preds = %109
  %111 = fcmp contract une float %67, 0.000000e+00
  br i1 %111, label %112, label %114

112:                                              ; preds = %110
  %113 = fdiv contract float %62, %67
  br label %114

114:                                              ; preds = %109, %110, %112
  %115 = phi float [ %113, %112 ], [ 0.000000e+00, %110 ], [ 1.000000e+00, %109 ]
  %116 = getelementptr inbounds float, float addrspace(1)* %34, i64 %64
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fmul contract float %115, %117
  br label %119

119:                                              ; preds = %98, %114
  %120 = phi float [ %118, %114 ], [ 0.000000e+00, %98 ]
  %121 = fadd contract float %99, %120
  %122 = sext i32 %57 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %34, i64 %122
  store float %121, float addrspace(1)* %123, align 4, !tbaa !7
  %124 = icmp eq i32 %63, %41
  br i1 %124, label %53, label %56, !llvm.loop !14

125:                                              ; preds = %45, %21, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
