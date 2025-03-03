; ModuleID = '../data/hip_kernels/7013/0/main.cu'
source_filename = "../data/hip_kernels/7013/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9ray_shootPiS_PfS0_S0_S0_S_S0_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = sdiv i32 %17, %18
  %20 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = mul nsw i32 %20, %19
  %22 = sub nsw i32 %17, %21
  %23 = sitofp i32 %22 to float
  %24 = load float, float addrspace(1)* %2, align 4, !tbaa !11, !amdgpu.noclobber !5
  %25 = fmul contract float %24, %23
  %26 = fadd contract float %25, -1.000000e+01
  %27 = sitofp i32 %19 to float
  %28 = fmul contract float %24, %27
  %29 = fadd contract float %28, -1.000000e+01
  %30 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %64

32:                                               ; preds = %8
  %33 = and i32 %30, 1
  %34 = icmp eq i32 %30, 1
  br i1 %34, label %39, label %35

35:                                               ; preds = %32
  %36 = and i32 %30, -2
  br label %71

37:                                               ; preds = %71
  %38 = zext i32 %113 to i64
  br label %39

39:                                               ; preds = %37, %32
  %40 = phi float [ undef, %32 ], [ %109, %37 ]
  %41 = phi float [ undef, %32 ], [ %112, %37 ]
  %42 = phi float [ %26, %32 ], [ %109, %37 ]
  %43 = phi float [ %29, %32 ], [ %112, %37 ]
  %44 = phi i64 [ 0, %32 ], [ %38, %37 ]
  %45 = icmp eq i32 %33, 0
  br i1 %45, label %64, label %46

46:                                               ; preds = %39
  %47 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !11, !amdgpu.noclobber !5
  %49 = fsub contract float %26, %48
  %50 = getelementptr inbounds float, float addrspace(1)* %4, i64 %44
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !11, !amdgpu.noclobber !5
  %52 = fsub contract float %29, %51
  %53 = fmul contract float %49, %49
  %54 = fmul contract float %52, %52
  %55 = fadd contract float %53, %54
  %56 = getelementptr inbounds float, float addrspace(1)* %5, i64 %44
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !11, !amdgpu.noclobber !5
  %58 = fmul contract float %49, %57
  %59 = fdiv contract float %58, %55
  %60 = fsub contract float %42, %59
  %61 = fmul contract float %57, %52
  %62 = fdiv contract float %61, %55
  %63 = fsub contract float %43, %62
  br label %64

64:                                               ; preds = %46, %39, %8
  %65 = phi float [ %29, %8 ], [ %41, %39 ], [ %63, %46 ]
  %66 = phi float [ %26, %8 ], [ %40, %39 ], [ %60, %46 ]
  %67 = fmul contract float %66, %66
  %68 = fmul contract float %65, %65
  %69 = fadd contract float %68, %67
  %70 = fcmp contract olt float %69, 0x3F847AE160000000
  br i1 %70, label %116, label %145

71:                                               ; preds = %71, %35
  %72 = phi float [ %26, %35 ], [ %109, %71 ]
  %73 = phi float [ %29, %35 ], [ %112, %71 ]
  %74 = phi i32 [ 0, %35 ], [ %113, %71 ]
  %75 = phi i32 [ 0, %35 ], [ %114, %71 ]
  %76 = zext i32 %74 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %3, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !11, !amdgpu.noclobber !5
  %79 = fsub contract float %26, %78
  %80 = getelementptr inbounds float, float addrspace(1)* %4, i64 %76
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11, !amdgpu.noclobber !5
  %82 = fsub contract float %29, %81
  %83 = fmul contract float %79, %79
  %84 = fmul contract float %82, %82
  %85 = fadd contract float %83, %84
  %86 = getelementptr inbounds float, float addrspace(1)* %5, i64 %76
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !11, !amdgpu.noclobber !5
  %88 = fmul contract float %79, %87
  %89 = fdiv contract float %88, %85
  %90 = fsub contract float %72, %89
  %91 = fmul contract float %87, %82
  %92 = fdiv contract float %91, %85
  %93 = fsub contract float %73, %92
  %94 = or i32 %74, 1
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %3, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11, !amdgpu.noclobber !5
  %98 = fsub contract float %26, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %4, i64 %95
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !11, !amdgpu.noclobber !5
  %101 = fsub contract float %29, %100
  %102 = fmul contract float %98, %98
  %103 = fmul contract float %101, %101
  %104 = fadd contract float %102, %103
  %105 = getelementptr inbounds float, float addrspace(1)* %5, i64 %95
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !11, !amdgpu.noclobber !5
  %107 = fmul contract float %98, %106
  %108 = fdiv contract float %107, %104
  %109 = fsub contract float %90, %108
  %110 = fmul contract float %106, %101
  %111 = fdiv contract float %110, %104
  %112 = fsub contract float %93, %111
  %113 = add nuw nsw i32 %74, 2
  %114 = add i32 %75, 2
  %115 = icmp eq i32 %114, %36
  br i1 %115, label %37, label %71, !llvm.loop !13

116:                                              ; preds = %64
  %117 = fdiv contract float %69, 0x3F847AE160000000
  %118 = fsub contract float 1.000000e+00, %117
  %119 = fcmp olt float %118, 0x39F0000000000000
  %120 = select i1 %119, float 0x41F0000000000000, float 1.000000e+00
  %121 = fmul float %118, %120
  %122 = tail call float @llvm.sqrt.f32(float %121)
  %123 = bitcast float %122 to i32
  %124 = add nsw i32 %123, -1
  %125 = bitcast i32 %124 to float
  %126 = add nsw i32 %123, 1
  %127 = bitcast i32 %126 to float
  %128 = tail call i1 @llvm.amdgcn.class.f32(float %121, i32 608)
  %129 = select i1 %119, float 0x3EF0000000000000, float 1.000000e+00
  %130 = fneg float %127
  %131 = tail call float @llvm.fma.f32(float %130, float %122, float %121)
  %132 = fcmp ogt float %131, 0.000000e+00
  %133 = fneg float %125
  %134 = tail call float @llvm.fma.f32(float %133, float %122, float %121)
  %135 = fcmp ole float %134, 0.000000e+00
  %136 = select i1 %135, float %125, float %122
  %137 = select i1 %132, float %127, float %136
  %138 = fmul float %129, %137
  %139 = select i1 %128, float %121, float %138
  %140 = fsub contract float 1.000000e+00, %139
  %141 = fmul contract float %140, 5.000000e-01
  %142 = fsub contract float 1.000000e+00, %141
  %143 = sext i32 %17 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %7, i64 %143
  store float %142, float addrspace(1)* %144, align 4, !tbaa !11
  br label %145

145:                                              ; preds = %116, %64
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
