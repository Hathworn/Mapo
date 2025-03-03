; ModuleID = '../data/hip_kernels/11940/3/main.cu'
source_filename = "../data/hip_kernels/11940/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5blendPfS_S_fPi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, float %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 1
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 2
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = mul nsw i32 %27, %25
  %29 = icmp slt i32 %14, %27
  %30 = icmp slt i32 %22, %25
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %131

32:                                               ; preds = %5
  %33 = mul nsw i32 %22, %27
  %34 = add i32 %33, %14
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !11, !amdgpu.noclobber !5
  %38 = fcmp contract olt float %37, 0x3FA99999A0000000
  %39 = select i1 %38, float 0.000000e+00, float %3
  %40 = icmp sgt i32 %23, 0
  br i1 %40, label %41, label %131

41:                                               ; preds = %32
  %42 = fpext float %39 to double
  %43 = fsub contract double 1.000000e+00, %42
  %44 = and i32 %23, 3
  %45 = icmp ult i32 %23, 4
  br i1 %45, label %109, label %46

46:                                               ; preds = %41
  %47 = and i32 %23, -4
  br label %48

48:                                               ; preds = %48, %46
  %49 = phi i32 [ 0, %46 ], [ %106, %48 ]
  %50 = phi i32 [ 0, %46 ], [ %107, %48 ]
  %51 = mul nsw i32 %28, %49
  %52 = add i32 %34, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !11
  %56 = fmul contract float %39, %55
  %57 = fpext float %56 to double
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11
  %60 = fpext float %59 to double
  %61 = fmul contract double %43, %60
  %62 = fadd contract double %61, %57
  %63 = fptrunc double %62 to float
  store float %63, float addrspace(1)* %58, align 4, !tbaa !11
  %64 = or i32 %49, 1
  %65 = mul nsw i32 %28, %64
  %66 = add i32 %34, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !11
  %70 = fmul contract float %39, %69
  %71 = fpext float %70 to double
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %67
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !11
  %74 = fpext float %73 to double
  %75 = fmul contract double %43, %74
  %76 = fadd contract double %75, %71
  %77 = fptrunc double %76 to float
  store float %77, float addrspace(1)* %72, align 4, !tbaa !11
  %78 = or i32 %49, 2
  %79 = mul nsw i32 %28, %78
  %80 = add i32 %34, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !11
  %84 = fmul contract float %39, %83
  %85 = fpext float %84 to double
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %81
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !11
  %88 = fpext float %87 to double
  %89 = fmul contract double %43, %88
  %90 = fadd contract double %89, %85
  %91 = fptrunc double %90 to float
  store float %91, float addrspace(1)* %86, align 4, !tbaa !11
  %92 = or i32 %49, 3
  %93 = mul nsw i32 %28, %92
  %94 = add i32 %34, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11
  %98 = fmul contract float %39, %97
  %99 = fpext float %98 to double
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !11
  %102 = fpext float %101 to double
  %103 = fmul contract double %43, %102
  %104 = fadd contract double %103, %99
  %105 = fptrunc double %104 to float
  store float %105, float addrspace(1)* %100, align 4, !tbaa !11
  %106 = add nuw nsw i32 %49, 4
  %107 = add i32 %50, 4
  %108 = icmp eq i32 %107, %47
  br i1 %108, label %109, label %48, !llvm.loop !13

109:                                              ; preds = %48, %41
  %110 = phi i32 [ 0, %41 ], [ %106, %48 ]
  %111 = icmp eq i32 %44, 0
  br i1 %111, label %131, label %112

112:                                              ; preds = %109, %112
  %113 = phi i32 [ %128, %112 ], [ %110, %109 ]
  %114 = phi i32 [ %129, %112 ], [ 0, %109 ]
  %115 = mul nsw i32 %28, %113
  %116 = add i32 %34, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !11
  %120 = fmul contract float %39, %119
  %121 = fpext float %120 to double
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %117
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !11
  %124 = fpext float %123 to double
  %125 = fmul contract double %43, %124
  %126 = fadd contract double %125, %121
  %127 = fptrunc double %126 to float
  store float %127, float addrspace(1)* %122, align 4, !tbaa !11
  %128 = add nuw nsw i32 %113, 1
  %129 = add i32 %114, 1
  %130 = icmp eq i32 %129, %44
  br i1 %130, label %131, label %112, !llvm.loop !15

131:                                              ; preds = %109, %112, %32, %5
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
