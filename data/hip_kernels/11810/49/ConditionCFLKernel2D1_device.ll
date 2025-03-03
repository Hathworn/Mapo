; ModuleID = '../data/hip_kernels/11810/49/main.cu'
source_filename = "../data/hip_kernels/11810/49/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21ConditionCFLKernel2D1PdS_S_iiS_S_S_iS_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, i32 %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture writeonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %13
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = add i32 %28, %22
  %30 = icmp sgt i32 %29, 0
  %31 = icmp slt i32 %29, %4
  %32 = select i1 %30, i1 %31, i1 false
  %33 = icmp slt i32 %21, %3
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %130

35:                                               ; preds = %12
  %36 = zext i32 %29 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7, !amdgpu.noclobber !6
  %39 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7, !amdgpu.noclobber !6
  %41 = fsub contract double %38, %40
  %42 = getelementptr inbounds double, double addrspace(1)* %2, i64 %36
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7, !amdgpu.noclobber !6
  %44 = fmul contract double %43, 2.000000e+00
  %45 = fmul contract double %44, 0x400921FB54442D18
  %46 = sitofp i32 %3 to double
  %47 = fdiv contract double %45, %46
  %48 = icmp eq i32 %8, 0
  %49 = mul nsw i32 %29, %3
  %50 = add nsw i32 %49, %21
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %6, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7
  br i1 %48, label %58, label %54

54:                                               ; preds = %35
  %55 = getelementptr inbounds double, double addrspace(1)* %7, i64 %36
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7, !amdgpu.noclobber !6
  %57 = fsub contract double %53, %56
  br label %58

58:                                               ; preds = %35, %54
  %59 = phi double [ %57, %54 ], [ %53, %35 ]
  %60 = getelementptr inbounds double, double addrspace(1)* %5, i64 %51
  store double %59, double addrspace(1)* %60, align 8, !tbaa !7
  %61 = getelementptr inbounds double, double addrspace(1)* %9, i64 %51
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !7
  %63 = fcmp contract olt double %47, %41
  %64 = select i1 %63, double %47, double %41
  %65 = fdiv contract double %62, %64
  %66 = getelementptr inbounds double, double addrspace(1)* %10, i64 %51
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7
  %68 = tail call double @llvm.fabs.f64(double %67)
  %69 = fdiv contract double %68, %41
  %70 = tail call double @llvm.fabs.f64(double %59)
  %71 = fdiv contract double %70, %47
  %72 = add nuw nsw i32 %29, 1
  %73 = mul nsw i32 %72, %3
  %74 = add nsw i32 %73, %21
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %10, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7
  %78 = fsub contract double %77, %67
  %79 = add nsw i32 %21, 1
  %80 = srem i32 %79, %3
  %81 = add nsw i32 %80, %49
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %6, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7
  %85 = getelementptr inbounds double, double addrspace(1)* %6, i64 %51
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7
  %87 = fsub contract double %84, %86
  %88 = fcmp contract ult double %78, 0.000000e+00
  %89 = fneg contract double %78
  %90 = select i1 %88, double %89, double 1.000000e-10
  %91 = fcmp contract ult double %87, 0.000000e+00
  %92 = fneg contract double %87
  %93 = select i1 %91, double %92, double 1.000000e-10
  %94 = fdiv contract double %90, %41
  %95 = fdiv contract double %93, %47
  %96 = fcmp contract ogt double %95, %94
  %97 = select i1 %96, double %95, double %94
  %98 = fmul contract double %97, 0x401FCF41F212D772
  %99 = fmul contract double %65, %65
  %100 = fmul contract double %69, %69
  %101 = fadd contract double %99, %100
  %102 = fmul contract double %71, %71
  %103 = fadd contract double %101, %102
  %104 = fmul contract double %98, %98
  %105 = fadd contract double %103, %104
  %106 = fcmp olt double %105, 0x1000000000000000
  %107 = select i1 %106, double 0x4FF0000000000000, double 1.000000e+00
  %108 = fmul double %105, %107
  %109 = tail call double @llvm.amdgcn.rsq.f64(double %108)
  %110 = fmul double %108, %109
  %111 = fmul double %109, 5.000000e-01
  %112 = fneg double %111
  %113 = tail call double @llvm.fma.f64(double %112, double %110, double 5.000000e-01)
  %114 = tail call double @llvm.fma.f64(double %111, double %113, double %111)
  %115 = tail call double @llvm.fma.f64(double %110, double %113, double %110)
  %116 = fneg double %115
  %117 = tail call double @llvm.fma.f64(double %116, double %115, double %108)
  %118 = tail call double @llvm.fma.f64(double %117, double %114, double %115)
  %119 = fneg double %118
  %120 = tail call double @llvm.fma.f64(double %119, double %118, double %108)
  %121 = tail call double @llvm.fma.f64(double %120, double %114, double %118)
  %122 = select i1 %106, double 0x37F0000000000000, double 1.000000e+00
  %123 = fmul double %122, %121
  %124 = fcmp oeq double %108, 0.000000e+00
  %125 = fcmp oeq double %108, 0x7FF0000000000000
  %126 = or i1 %124, %125
  %127 = select i1 %126, double %108, double %123
  %128 = fdiv contract double 5.000000e-01, %127
  %129 = getelementptr inbounds double, double addrspace(1)* %11, i64 %51
  store double %128, double addrspace(1)* %129, align 8, !tbaa !7
  br label %130

130:                                              ; preds = %58, %12
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
