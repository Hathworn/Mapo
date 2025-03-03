; ModuleID = '../data/hip_kernels/8783/2/main.cu'
source_filename = "../data/hip_kernels/8783/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31bilateralOptimizedGpuRowsKernelPfS_iijff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %3
  %26 = icmp slt i32 %24, %2
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %140

28:                                               ; preds = %7
  %29 = icmp eq i32 %4, 0
  br i1 %29, label %30, label %34

30:                                               ; preds = %28
  %31 = mul nsw i32 %24, %3
  %32 = add nsw i32 %31, %16
  %33 = sext i32 %32 to i64
  br label %53

34:                                               ; preds = %28
  %35 = lshr i32 %4, 1
  %36 = mul nsw i32 %24, %3
  %37 = add nsw i32 %36, %16
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = fmul contract float %6, 2.000000e+00
  %42 = fmul contract float %41, %6
  %43 = fpext float %6 to double
  %44 = fmul contract double %43, 0x401921FB54442D18
  %45 = fmul contract double %44, %43
  %46 = fmul contract float %5, 2.000000e+00
  %47 = fmul contract float %46, %5
  %48 = fpext float %5 to double
  %49 = fmul contract double %48, 0x401921FB54442D18
  %50 = fmul contract double %49, %48
  br label %57

51:                                               ; preds = %57
  %52 = fdiv contract float %136, %137
  br label %53

53:                                               ; preds = %30, %51
  %54 = phi i64 [ %33, %30 ], [ %38, %51 ]
  %55 = phi float [ 0x7FF8000000000000, %30 ], [ %52, %51 ]
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  store float %55, float addrspace(1)* %56, align 4, !tbaa !7
  br label %140

57:                                               ; preds = %34, %57
  %58 = phi i32 [ 0, %34 ], [ %138, %57 ]
  %59 = phi float [ 0.000000e+00, %34 ], [ %136, %57 ]
  %60 = phi float [ 0.000000e+00, %34 ], [ %137, %57 ]
  %61 = add nuw i32 %35, %58
  %62 = sub i32 %24, %61
  %63 = tail call i32 @llvm.smax.i32(i32 %62, i32 0)
  %64 = mul nsw i32 %63, %3
  %65 = add nsw i32 %64, %16
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = fsub contract float %68, %40
  %70 = fneg contract float %69
  %71 = fmul contract float %69, %70
  %72 = fdiv contract float %71, %42
  %73 = fmul float %72, 0x3FF7154760000000
  %74 = tail call float @llvm.rint.f32(float %73)
  %75 = fcmp ogt float %72, 0x40562E4300000000
  %76 = fcmp olt float %72, 0xC059D1DA00000000
  %77 = fneg float %73
  %78 = tail call float @llvm.fma.f32(float %72, float 0x3FF7154760000000, float %77)
  %79 = tail call float @llvm.fma.f32(float %72, float 0x3E54AE0BE0000000, float %78)
  %80 = fsub float %73, %74
  %81 = fadd float %79, %80
  %82 = tail call float @llvm.exp2.f32(float %81)
  %83 = fptosi float %74 to i32
  %84 = tail call float @llvm.amdgcn.ldexp.f32(float %82, i32 %83)
  %85 = select i1 %76, float 0.000000e+00, float %84
  %86 = select i1 %75, float 0x7FF0000000000000, float %85
  %87 = fpext float %86 to double
  %88 = fdiv contract double %87, %45
  %89 = fptrunc double %88 to float
  %90 = sub nsw i32 %24, %63
  %91 = mul nsw i32 %90, %90
  %92 = sitofp i32 %91 to float
  %93 = icmp eq i32 %24, %63
  %94 = select i1 %93, float 0x41F0000000000000, float 1.000000e+00
  %95 = fmul float %94, %92
  %96 = tail call float @llvm.sqrt.f32(float %95)
  %97 = bitcast float %96 to i32
  %98 = add nsw i32 %97, -1
  %99 = bitcast i32 %98 to float
  %100 = add nsw i32 %97, 1
  %101 = bitcast i32 %100 to float
  %102 = tail call i1 @llvm.amdgcn.class.f32(float %95, i32 608)
  %103 = select i1 %93, float 0x3EF0000000000000, float 1.000000e+00
  %104 = fneg float %101
  %105 = tail call float @llvm.fma.f32(float %104, float %96, float %95)
  %106 = fcmp ogt float %105, 0.000000e+00
  %107 = fneg float %99
  %108 = tail call float @llvm.fma.f32(float %107, float %96, float %95)
  %109 = fcmp ole float %108, 0.000000e+00
  %110 = select i1 %109, float %99, float %96
  %111 = select i1 %106, float %101, float %110
  %112 = fmul float %103, %111
  %113 = select i1 %102, float %95, float %112
  %114 = fneg contract float %113
  %115 = fmul contract float %113, %114
  %116 = fdiv contract float %115, %47
  %117 = fmul float %116, 0x3FF7154760000000
  %118 = tail call float @llvm.rint.f32(float %117)
  %119 = fcmp ogt float %116, 0x40562E4300000000
  %120 = fcmp olt float %116, 0xC059D1DA00000000
  %121 = fneg float %117
  %122 = tail call float @llvm.fma.f32(float %116, float 0x3FF7154760000000, float %121)
  %123 = tail call float @llvm.fma.f32(float %116, float 0x3E54AE0BE0000000, float %122)
  %124 = fsub float %117, %118
  %125 = fadd float %123, %124
  %126 = tail call float @llvm.exp2.f32(float %125)
  %127 = fptosi float %118 to i32
  %128 = tail call float @llvm.amdgcn.ldexp.f32(float %126, i32 %127)
  %129 = select i1 %120, float 0.000000e+00, float %128
  %130 = select i1 %119, float 0x7FF0000000000000, float %129
  %131 = fpext float %130 to double
  %132 = fdiv contract double %131, %50
  %133 = fptrunc double %132 to float
  %134 = fmul contract float %133, %89
  %135 = fmul contract float %68, %134
  %136 = fadd contract float %59, %135
  %137 = fadd contract float %60, %134
  %138 = add nuw nsw i32 %58, 1
  %139 = icmp eq i32 %138, %4
  br i1 %139, label %51, label %57, !llvm.loop !11

140:                                              ; preds = %7, %53
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.enable"}
