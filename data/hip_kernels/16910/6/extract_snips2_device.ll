; ModuleID = '../data/hip_kernels/16910/6/main.cu'
source_filename = "../data/hip_kernels/16910/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14extract_snips2PKdPKfPKiS4_S4_S4_S4_S2_Pf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 13
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !4, !amdgpu.noclobber !8
  %18 = fptosi double %17 to i32
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 1
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !10, !amdgpu.noclobber !8
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %108

24:                                               ; preds = %9
  %25 = tail call i32 @llvm.smin.i32(i32 %22, i32 5000)
  %26 = getelementptr inbounds double, double addrspace(1)* %0, i64 10
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !4, !amdgpu.noclobber !8
  %28 = fptosi double %27 to i32
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %30 = mul nsw i32 %20, %28
  %31 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %32 = getelementptr i8, i8 addrspace(4)* %31, i64 6
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  br label %34

34:                                               ; preds = %24, %105
  %35 = phi i32 [ 0, %24 ], [ %106, %105 ]
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !10, !amdgpu.noclobber !8
  %39 = icmp eq i32 %38, %20
  br i1 %39, label %40, label %105

40:                                               ; preds = %34
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %36
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !10, !amdgpu.noclobber !8
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !10, !amdgpu.noclobber !8
  %46 = freeze i32 %45
  %47 = freeze i32 %18
  %48 = sdiv i32 %46, %47
  %49 = mul i32 %48, %47
  %50 = sub i32 %46, %49
  %51 = icmp sgt i32 %29, %50
  br i1 %51, label %105, label %52

52:                                               ; preds = %40
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %54 = sitofp i32 %50 to double
  %55 = fadd contract double %54, 1.000000e+00
  %56 = mul nsw i32 %48, %12
  %57 = add nsw i32 %56, %19
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %7, i64 %58
  %60 = mul i32 %35, %15
  %61 = load i16, i16 addrspace(4)* %33, align 2, !range !12, !invariant.load !8
  %62 = zext i16 %61 to i32
  br label %63

63:                                               ; preds = %52, %63
  %64 = phi i32 [ %29, %52 ], [ %103, %63 ]
  %65 = load float, float addrspace(1)* %53, align 4, !tbaa !13
  %66 = fpext float %65 to double
  %67 = fdiv contract double %66, %55
  %68 = fcmp olt double %67, 0x1000000000000000
  %69 = select i1 %68, double 0x4FF0000000000000, double 1.000000e+00
  %70 = fmul double %67, %69
  %71 = tail call double @llvm.amdgcn.rsq.f64(double %70)
  %72 = fmul double %70, %71
  %73 = fmul double %71, 5.000000e-01
  %74 = fneg double %73
  %75 = tail call double @llvm.fma.f64(double %74, double %72, double 5.000000e-01)
  %76 = tail call double @llvm.fma.f64(double %73, double %75, double %73)
  %77 = tail call double @llvm.fma.f64(double %72, double %75, double %72)
  %78 = fneg double %77
  %79 = tail call double @llvm.fma.f64(double %78, double %77, double %70)
  %80 = tail call double @llvm.fma.f64(double %79, double %76, double %77)
  %81 = fneg double %80
  %82 = tail call double @llvm.fma.f64(double %81, double %80, double %70)
  %83 = tail call double @llvm.fma.f64(double %82, double %76, double %80)
  %84 = select i1 %68, double 0x37F0000000000000, double 1.000000e+00
  %85 = fmul double %84, %83
  %86 = fcmp oeq double %70, 0.000000e+00
  %87 = fcmp oeq double %70, 0x7FF0000000000000
  %88 = or i1 %86, %87
  %89 = select i1 %88, double %70, double %85
  %90 = load float, float addrspace(1)* %59, align 4, !tbaa !13
  %91 = fpext float %90 to double
  %92 = fmul contract double %89, %91
  %93 = fptrunc double %92 to float
  %94 = add nsw i32 %64, %30
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !10, !amdgpu.noclobber !8
  %98 = add i32 %97, %60
  %99 = mul i32 %98, %12
  %100 = add i32 %99, %19
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %8, i64 %101
  store float %93, float addrspace(1)* %102, align 4, !tbaa !13
  %103 = add i32 %64, %62
  %104 = icmp sgt i32 %103, %50
  br i1 %104, label %105, label %63, !llvm.loop !15

105:                                              ; preds = %63, %40, %34
  %106 = add nuw nsw i32 %35, 1
  %107 = icmp eq i32 %106, %25
  br i1 %107, label %108, label %34, !llvm.loop !17

108:                                              ; preds = %105, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{i16 1, i16 1025}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !6, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
