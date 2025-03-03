; ModuleID = '../data/hip_kernels/16206/10/main.cu'
source_filename = "../data/hip_kernels/16206/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sAds = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5pcr_kfffPfi(float %0, float %1, float %2, float addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
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
  %38 = getelementptr inbounds float, float addrspace(3)* %33, i32 %11
  store float %0, float addrspace(3)* %38, align 4, !tbaa !7
  %39 = getelementptr inbounds float, float addrspace(3)* %34, i32 %11
  store float %1, float addrspace(3)* %39, align 4, !tbaa !7
  %40 = getelementptr inbounds float, float addrspace(3)* %35, i32 %11
  store float %2, float addrspace(3)* %40, align 4, !tbaa !7
  %41 = mul nsw i32 %20, %4
  %42 = add nsw i32 %41, %11
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = getelementptr inbounds float, float addrspace(3)* %36, i32 %11
  store float %45, float addrspace(3)* %46, align 4, !tbaa !7
  %47 = getelementptr inbounds float, float addrspace(3)* %37, i32 %11
  %48 = bitcast float addrspace(3)* %47 to i32 addrspace(3)*
  store i32 %11, i32 addrspace(3)* %48, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = tail call i32 @llvm.smax.i32(i32 %11, i32 1)
  %50 = add nsw i32 %49, -1
  %51 = add nuw nsw i32 %11, 1
  %52 = icmp slt i32 %51, %4
  %53 = select i1 %52, i32 %51, i32 0
  %54 = sitofp i32 %4 to float
  %55 = tail call i1 @llvm.amdgcn.class.f32(float %54, i32 144)
  %56 = select i1 %55, float 0x41F0000000000000, float 1.000000e+00
  %57 = fmul float %56, %54
  %58 = tail call float @llvm.log2.f32(float %57)
  %59 = select i1 %55, float 3.200000e+01, float 0.000000e+00
  %60 = fsub float %58, %59
  %61 = fptosi float %60 to i32
  %62 = icmp slt i32 %61, 0
  br i1 %62, label %130, label %63

63:                                               ; preds = %5
  %64 = getelementptr inbounds float, float addrspace(3)* %34, i32 %50
  %65 = getelementptr inbounds float, float addrspace(3)* %33, i32 %50
  %66 = getelementptr inbounds float, float addrspace(3)* %36, i32 %50
  %67 = getelementptr inbounds float, float addrspace(3)* %33, i32 %53
  %68 = getelementptr inbounds float, float addrspace(3)* %34, i32 %53
  %69 = getelementptr inbounds float, float addrspace(3)* %35, i32 %53
  %70 = getelementptr inbounds float, float addrspace(3)* %36, i32 %53
  %71 = getelementptr inbounds float, float addrspace(3)* %33, i32 %32
  %72 = getelementptr inbounds float, float addrspace(3)* %34, i32 %32
  %73 = getelementptr inbounds float, float addrspace(3)* %35, i32 %32
  %74 = getelementptr inbounds float, float addrspace(3)* %36, i32 %32
  %75 = getelementptr inbounds float, float addrspace(3)* %37, i32 %32
  %76 = bitcast float addrspace(3)* %75 to i32 addrspace(3)*
  br label %77

77:                                               ; preds = %63, %125
  %78 = phi i32 [ 0, %63 ], [ %126, %125 ]
  %79 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !11
  %80 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %81 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %82 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %83 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %84 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %85 = tail call float @llvm.fabs.f32(float %80)
  %86 = fcmp contract ogt float %85, 0x3E7AD7F2A0000000
  br i1 %86, label %87, label %99

87:                                               ; preds = %77
  %88 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %89 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %90 = fmul contract float %80, %82
  %91 = fdiv contract float %90, %84
  %92 = fsub contract float %81, %91
  %93 = fmul contract float %80, %89
  %94 = fdiv contract float %93, %84
  %95 = fsub contract float %83, %94
  %96 = fneg contract float %80
  %97 = fmul contract float %88, %96
  %98 = fdiv contract float %97, %84
  br label %99

99:                                               ; preds = %87, %77
  %100 = phi float [ %95, %87 ], [ %83, %77 ]
  %101 = phi float [ %92, %87 ], [ %81, %77 ]
  %102 = phi float [ %98, %87 ], [ %80, %77 ]
  %103 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %104 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %105 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %106 = tail call float @llvm.fabs.f32(float %103)
  %107 = fcmp contract ogt float %106, 0x3E7AD7F2A0000000
  br i1 %107, label %108, label %119

108:                                              ; preds = %99
  %109 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %110 = fmul contract float %103, %105
  %111 = fdiv contract float %110, %104
  %112 = fsub contract float %101, %111
  %113 = fmul contract float %105, %109
  %114 = fdiv contract float %113, %104
  %115 = fsub contract float %100, %114
  %116 = fneg contract float %82
  %117 = fmul contract float %105, %116
  %118 = fdiv contract float %117, %104
  br label %119

119:                                              ; preds = %108, %99
  %120 = phi float [ %118, %108 ], [ %82, %99 ]
  %121 = phi float [ %115, %108 ], [ %100, %99 ]
  %122 = phi float [ %112, %108 ], [ %101, %99 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %123 = icmp slt i32 %78, %61
  br i1 %123, label %124, label %125

124:                                              ; preds = %119
  store float %102, float addrspace(3)* %71, align 4, !tbaa !7
  store float %122, float addrspace(3)* %72, align 4, !tbaa !7
  store float %120, float addrspace(3)* %73, align 4, !tbaa !7
  store float %121, float addrspace(3)* %74, align 4, !tbaa !7
  store i32 %79, i32 addrspace(3)* %76, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %125

125:                                              ; preds = %119, %124
  %126 = add nuw i32 %78, 1
  %127 = icmp eq i32 %78, %61
  br i1 %127, label %128, label %77, !llvm.loop !13

128:                                              ; preds = %125
  %129 = fdiv contract float %121, %122
  br label %130

130:                                              ; preds = %128, %5
  %131 = phi float [ %129, %128 ], [ undef, %5 ]
  store float %131, float addrspace(3)* %46, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %132 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %133 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !11
  %134 = add nsw i32 %133, %41
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %3, i64 %135
  store float %132, float addrspace(1)* %136, align 4, !tbaa !7
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
