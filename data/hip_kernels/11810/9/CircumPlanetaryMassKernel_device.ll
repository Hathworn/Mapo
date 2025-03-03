; ModuleID = '../data/hip_kernels/11810/9/main.cu'
source_filename = "../data/hip_kernels/11810/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25CircumPlanetaryMassKernelPdS_S_S_ddiidS_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double %4, double %5, i32 %6, i32 %7, double %8, double addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = add i32 %18, %11
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %20
  %28 = icmp slt i32 %27, %6
  %29 = icmp slt i32 %19, %7
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %77

31:                                               ; preds = %10
  %32 = mul nsw i32 %27, %7
  %33 = add nsw i32 %32, %19
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !6
  %37 = fsub contract double %36, %4
  %38 = fmul contract double %37, %37
  %39 = getelementptr inbounds double, double addrspace(1)* %3, i64 %34
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7, !amdgpu.noclobber !6
  %41 = fsub contract double %40, %5
  %42 = fmul contract double %41, %41
  %43 = fadd contract double %38, %42
  %44 = fcmp olt double %43, 0x1000000000000000
  %45 = select i1 %44, double 0x4FF0000000000000, double 1.000000e+00
  %46 = fmul double %43, %45
  %47 = tail call double @llvm.amdgcn.rsq.f64(double %46)
  %48 = fmul double %46, %47
  %49 = fmul double %47, 5.000000e-01
  %50 = fneg double %49
  %51 = tail call double @llvm.fma.f64(double %50, double %48, double 5.000000e-01)
  %52 = tail call double @llvm.fma.f64(double %49, double %51, double %49)
  %53 = tail call double @llvm.fma.f64(double %48, double %51, double %48)
  %54 = fneg double %53
  %55 = tail call double @llvm.fma.f64(double %54, double %53, double %46)
  %56 = tail call double @llvm.fma.f64(double %55, double %52, double %53)
  %57 = fneg double %56
  %58 = tail call double @llvm.fma.f64(double %57, double %56, double %46)
  %59 = tail call double @llvm.fma.f64(double %58, double %52, double %56)
  %60 = select i1 %44, double 0x37F0000000000000, double 1.000000e+00
  %61 = fmul double %60, %59
  %62 = fcmp oeq double %46, 0.000000e+00
  %63 = fcmp oeq double %46, 0x7FF0000000000000
  %64 = or i1 %62, %63
  %65 = select i1 %64, double %46, double %61
  %66 = fcmp contract olt double %65, %8
  br i1 %66, label %67, label %74

67:                                               ; preds = %31
  %68 = sext i32 %27 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7, !amdgpu.noclobber !6
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7, !amdgpu.noclobber !6
  %73 = fmul contract double %70, %72
  br label %74

74:                                               ; preds = %31, %67
  %75 = phi double [ %73, %67 ], [ 0.000000e+00, %31 ]
  %76 = getelementptr inbounds double, double addrspace(1)* %9, i64 %34
  store double %75, double addrspace(1)* %76, align 8, !tbaa !7
  br label %77

77:                                               ; preds = %74, %10
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
