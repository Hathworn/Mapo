; ModuleID = '../data/hip_kernels/16206/9/main.cu'
source_filename = "../data/hip_kernels/16206/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sAds = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5pcr_kPfS_S_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = freeze i32 %6
  %8 = freeze i32 %4
  %9 = udiv i32 %7, %8
  %10 = mul i32 %9, %8
  %11 = sub i32 %7, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %17, %4
  %19 = mul i32 %18, %12
  %20 = add i32 %19, %9
  %21 = mul i32 %4, 5
  %22 = mul i32 %21, %9
  %23 = freeze i32 %4
  %24 = sdiv i32 %23, 2
  %25 = mul i32 %24, 2
  %26 = sub i32 %23, %25
  %27 = add nsw i32 %24, %26
  %28 = and i32 %11, 1
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32 0, i32 %27
  %31 = lshr i32 %11, 1
  %32 = add nsw i32 %30, %31
  %33 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sAds, i32 0, i32 %22
  %34 = getelementptr inbounds float, float addrspace(3)* %33, i32 %4
  %35 = getelementptr inbounds float, float addrspace(3)* %34, i32 %4
  %36 = getelementptr inbounds float, float addrspace(3)* %35, i32 %4
  %37 = getelementptr inbounds float, float addrspace(3)* %36, i32 %4
  %38 = mul nsw i32 %20, %4
  %39 = add nsw i32 %38, %11
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !6
  %43 = getelementptr inbounds float, float addrspace(3)* %33, i32 %11
  store float %42, float addrspace(3)* %43, align 4, !tbaa !7
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = getelementptr inbounds float, float addrspace(3)* %34, i32 %11
  store float %45, float addrspace(3)* %46, align 4, !tbaa !7
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = getelementptr inbounds float, float addrspace(3)* %35, i32 %11
  store float %48, float addrspace(3)* %49, align 4, !tbaa !7
  %50 = getelementptr inbounds float, float addrspace(1)* %3, i64 %40
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = getelementptr inbounds float, float addrspace(3)* %36, i32 %11
  store float %51, float addrspace(3)* %52, align 4, !tbaa !7
  %53 = getelementptr inbounds float, float addrspace(3)* %37, i32 %11
  %54 = bitcast float addrspace(3)* %53 to i32 addrspace(3)*
  store i32 %11, i32 addrspace(3)* %54, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = tail call i32 @llvm.smax.i32(i32 %11, i32 1)
  %56 = add nsw i32 %55, -1
  %57 = add nuw nsw i32 %11, 1
  %58 = icmp slt i32 %57, %4
  %59 = select i1 %58, i32 %57, i32 0
  %60 = sitofp i32 %4 to float
  %61 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 144)
  %62 = select i1 %61, float 0x41F0000000000000, float 1.000000e+00
  %63 = fmul float %62, %60
  %64 = tail call float @llvm.log2.f32(float %63)
  %65 = select i1 %61, float 3.200000e+01, float 0.000000e+00
  %66 = fsub float %64, %65
  %67 = fptosi float %66 to i32
  %68 = icmp slt i32 %67, 0
  br i1 %68, label %134, label %69

69:                                               ; preds = %5
  %70 = getelementptr inbounds float, float addrspace(3)* %34, i32 %56
  %71 = getelementptr inbounds float, float addrspace(3)* %33, i32 %56
  %72 = getelementptr inbounds float, float addrspace(3)* %35, i32 %56
  %73 = getelementptr inbounds float, float addrspace(3)* %36, i32 %56
  %74 = getelementptr inbounds float, float addrspace(3)* %33, i32 %59
  %75 = getelementptr inbounds float, float addrspace(3)* %34, i32 %59
  %76 = getelementptr inbounds float, float addrspace(3)* %35, i32 %59
  %77 = getelementptr inbounds float, float addrspace(3)* %36, i32 %59
  %78 = getelementptr inbounds float, float addrspace(3)* %33, i32 %32
  %79 = getelementptr inbounds float, float addrspace(3)* %34, i32 %32
  %80 = getelementptr inbounds float, float addrspace(3)* %35, i32 %32
  %81 = getelementptr inbounds float, float addrspace(3)* %36, i32 %32
  %82 = getelementptr inbounds float, float addrspace(3)* %37, i32 %32
  %83 = bitcast float addrspace(3)* %82 to i32 addrspace(3)*
  br label %84

84:                                               ; preds = %69, %129
  %85 = phi i32 [ 0, %69 ], [ %130, %129 ]
  %86 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !11
  %87 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %88 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %89 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %90 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %91 = tail call float @llvm.fabs.f32(float %87)
  %92 = fcmp contract ogt float %91, 0x3E7AD7F2A0000000
  br i1 %92, label %93, label %105

93:                                               ; preds = %84
  %94 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %95 = load float, float addrspace(3)* %71, align 4, !tbaa !7
  %96 = load float, float addrspace(3)* %72, align 4, !tbaa !7
  %97 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %98 = fdiv contract float %87, %94
  %99 = fmul contract float %98, %96
  %100 = fsub contract float %88, %99
  %101 = fmul contract float %98, %97
  %102 = fsub contract float %90, %101
  %103 = fneg contract float %95
  %104 = fmul contract float %98, %103
  br label %105

105:                                              ; preds = %93, %84
  %106 = phi float [ %102, %93 ], [ %90, %84 ]
  %107 = phi float [ %100, %93 ], [ %88, %84 ]
  %108 = phi float [ %104, %93 ], [ %87, %84 ]
  %109 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %110 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %111 = fdiv contract float %89, %110
  %112 = tail call float @llvm.fabs.f32(float %109)
  %113 = fcmp contract ogt float %112, 0x3E7AD7F2A0000000
  br i1 %113, label %114, label %123

114:                                              ; preds = %105
  %115 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  %116 = load float, float addrspace(3)* %77, align 4, !tbaa !7
  %117 = fmul contract float %109, %111
  %118 = fsub contract float %107, %117
  %119 = fmul contract float %111, %116
  %120 = fsub contract float %106, %119
  %121 = fneg contract float %115
  %122 = fmul contract float %111, %121
  br label %123

123:                                              ; preds = %114, %105
  %124 = phi float [ %120, %114 ], [ %106, %105 ]
  %125 = phi float [ %122, %114 ], [ %89, %105 ]
  %126 = phi float [ %118, %114 ], [ %107, %105 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %127 = icmp slt i32 %85, %67
  br i1 %127, label %128, label %129

128:                                              ; preds = %123
  store float %108, float addrspace(3)* %78, align 4, !tbaa !7
  store float %126, float addrspace(3)* %79, align 4, !tbaa !7
  store float %125, float addrspace(3)* %80, align 4, !tbaa !7
  store float %124, float addrspace(3)* %81, align 4, !tbaa !7
  store i32 %86, i32 addrspace(3)* %83, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %129

129:                                              ; preds = %128, %123
  %130 = add nuw i32 %85, 1
  %131 = icmp eq i32 %85, %67
  br i1 %131, label %132, label %84, !llvm.loop !13

132:                                              ; preds = %129
  %133 = fdiv contract float %124, %126
  br label %134

134:                                              ; preds = %132, %5
  %135 = phi float [ %133, %132 ], [ undef, %5 ]
  store float %135, float addrspace(3)* %52, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %136 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %137 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !11
  %138 = add nsw i32 %137, %38
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %3, i64 %139
  store float %136, float addrspace(1)* %140, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
