; ModuleID = '../data/hip_kernels/8783/0/main.cu'
source_filename = "../data/hip_kernels/8783/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23bilateralNaiveGpuKernelPfS_iijff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
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
  br i1 %27, label %28, label %153

28:                                               ; preds = %7
  %29 = icmp eq i32 %4, 0
  br i1 %29, label %30, label %34

30:                                               ; preds = %28
  %31 = mul nsw i32 %24, %3
  %32 = add nsw i32 %31, %16
  %33 = sext i32 %32 to i64
  br label %62

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
  br label %51

51:                                               ; preds = %34, %66
  %52 = phi i32 [ 0, %34 ], [ %67, %66 ]
  %53 = phi float [ 0.000000e+00, %34 ], [ %149, %66 ]
  %54 = phi float [ 0.000000e+00, %34 ], [ %150, %66 ]
  %55 = add nuw i32 %35, %52
  %56 = sub i32 %16, %55
  %57 = tail call i32 @llvm.smax.i32(i32 %56, i32 0)
  %58 = sub nsw i32 %16, %57
  %59 = mul nsw i32 %58, %58
  br label %69

60:                                               ; preds = %66
  %61 = fdiv contract float %149, %150
  br label %62

62:                                               ; preds = %30, %60
  %63 = phi i64 [ %33, %30 ], [ %38, %60 ]
  %64 = phi float [ 0x7FF8000000000000, %30 ], [ %61, %60 ]
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  store float %64, float addrspace(1)* %65, align 4, !tbaa !7
  br label %153

66:                                               ; preds = %69
  %67 = add nuw nsw i32 %52, 1
  %68 = icmp eq i32 %67, %4
  br i1 %68, label %60, label %51, !llvm.loop !11

69:                                               ; preds = %51, %69
  %70 = phi i32 [ 0, %51 ], [ %151, %69 ]
  %71 = phi float [ %53, %51 ], [ %149, %69 ]
  %72 = phi float [ %54, %51 ], [ %150, %69 ]
  %73 = add nuw i32 %35, %70
  %74 = sub i32 %24, %73
  %75 = tail call i32 @llvm.smax.i32(i32 %74, i32 0)
  %76 = mul nsw i32 %75, %3
  %77 = add nsw i32 %76, %57
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = fsub contract float %80, %40
  %82 = fneg contract float %81
  %83 = fmul contract float %81, %82
  %84 = fdiv contract float %83, %42
  %85 = fmul float %84, 0x3FF7154760000000
  %86 = tail call float @llvm.rint.f32(float %85)
  %87 = fcmp ogt float %84, 0x40562E4300000000
  %88 = fcmp olt float %84, 0xC059D1DA00000000
  %89 = fneg float %85
  %90 = tail call float @llvm.fma.f32(float %84, float 0x3FF7154760000000, float %89)
  %91 = tail call float @llvm.fma.f32(float %84, float 0x3E54AE0BE0000000, float %90)
  %92 = fsub float %85, %86
  %93 = fadd float %91, %92
  %94 = tail call float @llvm.exp2.f32(float %93)
  %95 = fptosi float %86 to i32
  %96 = tail call float @llvm.amdgcn.ldexp.f32(float %94, i32 %95)
  %97 = select i1 %88, float 0.000000e+00, float %96
  %98 = select i1 %87, float 0x7FF0000000000000, float %97
  %99 = fpext float %98 to double
  %100 = fdiv contract double %99, %45
  %101 = fptrunc double %100 to float
  %102 = sub nsw i32 %24, %75
  %103 = mul nsw i32 %102, %102
  %104 = add nuw nsw i32 %103, %59
  %105 = sitofp i32 %104 to float
  %106 = icmp eq i32 %104, 0
  %107 = select i1 %106, float 0x41F0000000000000, float 1.000000e+00
  %108 = fmul float %107, %105
  %109 = tail call float @llvm.sqrt.f32(float %108)
  %110 = bitcast float %109 to i32
  %111 = add nsw i32 %110, -1
  %112 = bitcast i32 %111 to float
  %113 = add nsw i32 %110, 1
  %114 = bitcast i32 %113 to float
  %115 = tail call i1 @llvm.amdgcn.class.f32(float %108, i32 608)
  %116 = select i1 %106, float 0x3EF0000000000000, float 1.000000e+00
  %117 = fneg float %114
  %118 = tail call float @llvm.fma.f32(float %117, float %109, float %108)
  %119 = fcmp ogt float %118, 0.000000e+00
  %120 = fneg float %112
  %121 = tail call float @llvm.fma.f32(float %120, float %109, float %108)
  %122 = fcmp ole float %121, 0.000000e+00
  %123 = select i1 %122, float %112, float %109
  %124 = select i1 %119, float %114, float %123
  %125 = fmul float %116, %124
  %126 = select i1 %115, float %108, float %125
  %127 = fneg contract float %126
  %128 = fmul contract float %126, %127
  %129 = fdiv contract float %128, %47
  %130 = fmul float %129, 0x3FF7154760000000
  %131 = tail call float @llvm.rint.f32(float %130)
  %132 = fcmp ogt float %129, 0x40562E4300000000
  %133 = fcmp olt float %129, 0xC059D1DA00000000
  %134 = fneg float %130
  %135 = tail call float @llvm.fma.f32(float %129, float 0x3FF7154760000000, float %134)
  %136 = tail call float @llvm.fma.f32(float %129, float 0x3E54AE0BE0000000, float %135)
  %137 = fsub float %130, %131
  %138 = fadd float %136, %137
  %139 = tail call float @llvm.exp2.f32(float %138)
  %140 = fptosi float %131 to i32
  %141 = tail call float @llvm.amdgcn.ldexp.f32(float %139, i32 %140)
  %142 = select i1 %133, float 0.000000e+00, float %141
  %143 = select i1 %132, float 0x7FF0000000000000, float %142
  %144 = fpext float %143 to double
  %145 = fdiv contract double %144, %50
  %146 = fptrunc double %145 to float
  %147 = fmul contract float %146, %101
  %148 = fmul contract float %80, %147
  %149 = fadd contract float %71, %148
  %150 = fadd contract float %72, %147
  %151 = add nuw nsw i32 %70, 1
  %152 = icmp eq i32 %151, %4
  br i1 %152, label %66, label %69, !llvm.loop !13

153:                                              ; preds = %7, %62
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
