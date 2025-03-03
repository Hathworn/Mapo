; ModuleID = '../data/hip_kernels/1574/47/main.cu'
source_filename = "../data/hip_kernels/1574/47/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16average_snips_v3PKdPKiS2_PKfS4_Pf(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readnone %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %8 = fptosi double %7 to i32
  %9 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %10 = load double, double addrspace(1)* %9, align 8, !tbaa !4, !amdgpu.noclobber !8
  %11 = fptosi double %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = icmp sgt i32 %8, 0
  br i1 %14, label %15, label %135

15:                                               ; preds = %6
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !4, !amdgpu.noclobber !8
  %18 = fptosi double %17 to i32
  %19 = mul i32 %13, %11
  %20 = add i32 %19, %12
  %21 = mul i32 %20, %18
  %22 = add i32 %21, %12
  %23 = and i32 %8, 3
  %24 = icmp ult i32 %8, 4
  br i1 %24, label %108, label %25

25:                                               ; preds = %15
  %26 = and i32 %8, -4
  br label %27

27:                                               ; preds = %104, %25
  %28 = phi i32 [ 0, %25 ], [ %105, %104 ]
  %29 = phi i32 [ 0, %25 ], [ %106, %104 ]
  %30 = zext i32 %28 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !10, !amdgpu.noclobber !8
  %33 = icmp eq i32 %32, %13
  br i1 %33, label %34, label %47

34:                                               ; preds = %27
  %35 = mul nsw i32 %28, %11
  %36 = add nsw i32 %35, %12
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !12
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !10, !amdgpu.noclobber !8
  %42 = add i32 %22, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %5, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !12
  %46 = fadd contract float %39, %45
  store float %46, float addrspace(1)* %44, align 4, !tbaa !12
  br label %47

47:                                               ; preds = %27, %34
  %48 = or i32 %28, 1
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !10, !amdgpu.noclobber !8
  %52 = icmp eq i32 %51, %13
  br i1 %52, label %53, label %66

53:                                               ; preds = %47
  %54 = mul nsw i32 %48, %11
  %55 = add nsw i32 %54, %12
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !12
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %49
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !10, !amdgpu.noclobber !8
  %61 = add i32 %22, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %5, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !12
  %65 = fadd contract float %58, %64
  store float %65, float addrspace(1)* %63, align 4, !tbaa !12
  br label %66

66:                                               ; preds = %53, %47
  %67 = or i32 %28, 2
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !10, !amdgpu.noclobber !8
  %71 = icmp eq i32 %70, %13
  br i1 %71, label %72, label %85

72:                                               ; preds = %66
  %73 = mul nsw i32 %67, %11
  %74 = add nsw i32 %73, %12
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %3, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !12
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !10, !amdgpu.noclobber !8
  %80 = add i32 %22, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %5, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !12
  %84 = fadd contract float %77, %83
  store float %84, float addrspace(1)* %82, align 4, !tbaa !12
  br label %85

85:                                               ; preds = %72, %66
  %86 = or i32 %28, 3
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !10, !amdgpu.noclobber !8
  %90 = icmp eq i32 %89, %13
  br i1 %90, label %91, label %104

91:                                               ; preds = %85
  %92 = mul nsw i32 %86, %11
  %93 = add nsw i32 %92, %12
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %3, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !12
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %87
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !10, !amdgpu.noclobber !8
  %99 = add i32 %22, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %5, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !12
  %103 = fadd contract float %96, %102
  store float %103, float addrspace(1)* %101, align 4, !tbaa !12
  br label %104

104:                                              ; preds = %91, %85
  %105 = add nuw nsw i32 %28, 4
  %106 = add i32 %29, 4
  %107 = icmp eq i32 %106, %26
  br i1 %107, label %108, label %27, !llvm.loop !14

108:                                              ; preds = %104, %15
  %109 = phi i32 [ 0, %15 ], [ %105, %104 ]
  %110 = icmp eq i32 %23, 0
  br i1 %110, label %135, label %111

111:                                              ; preds = %108, %131
  %112 = phi i32 [ %132, %131 ], [ %109, %108 ]
  %113 = phi i32 [ %133, %131 ], [ 0, %108 ]
  %114 = zext i32 %112 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !10, !amdgpu.noclobber !8
  %117 = icmp eq i32 %116, %13
  br i1 %117, label %118, label %131

118:                                              ; preds = %111
  %119 = mul nsw i32 %112, %11
  %120 = add nsw i32 %119, %12
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %3, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !12
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %114
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !10, !amdgpu.noclobber !8
  %126 = add i32 %22, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %5, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !12
  %130 = fadd contract float %123, %129
  store float %130, float addrspace(1)* %128, align 4, !tbaa !12
  br label %131

131:                                              ; preds = %118, %111
  %132 = add nuw nsw i32 %112, 1
  %133 = add i32 %113, 1
  %134 = icmp eq i32 %133, %23
  br i1 %134, label %135, label %111, !llvm.loop !16

135:                                              ; preds = %108, %131, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !6, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
