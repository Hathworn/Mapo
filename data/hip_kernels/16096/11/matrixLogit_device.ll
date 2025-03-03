; ModuleID = '../data/hip_kernels/16096/11/main.cu'
source_filename = "../data/hip_kernels/16096/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11matrixLogitPdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %2
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %118

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %3
  %27 = add nsw i32 %26, %13
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !5
  %31 = fsub contract double 1.000000e+00, %30
  %32 = fdiv contract double %30, %31
  %33 = tail call double @llvm.amdgcn.frexp.mant.f64(double %32)
  %34 = fcmp olt double %33, 0x3FE5555555555555
  %35 = zext i1 %34 to i32
  %36 = tail call double @llvm.amdgcn.ldexp.f64(double %33, i32 %35)
  %37 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %32)
  %38 = sub nsw i32 %37, %35
  %39 = fadd double %36, -1.000000e+00
  %40 = fadd double %36, 1.000000e+00
  %41 = fadd double %40, -1.000000e+00
  %42 = fsub double %36, %41
  %43 = tail call double @llvm.amdgcn.rcp.f64(double %40)
  %44 = fneg double %40
  %45 = tail call double @llvm.fma.f64(double %44, double %43, double 1.000000e+00)
  %46 = tail call double @llvm.fma.f64(double %45, double %43, double %43)
  %47 = tail call double @llvm.fma.f64(double %44, double %46, double 1.000000e+00)
  %48 = tail call double @llvm.fma.f64(double %47, double %46, double %46)
  %49 = fmul double %39, %48
  %50 = fmul double %40, %49
  %51 = fneg double %50
  %52 = tail call double @llvm.fma.f64(double %49, double %40, double %51)
  %53 = tail call double @llvm.fma.f64(double %49, double %42, double %52)
  %54 = fadd double %50, %53
  %55 = fsub double %54, %50
  %56 = fsub double %53, %55
  %57 = fsub double %39, %54
  %58 = fsub double %39, %57
  %59 = fsub double %58, %54
  %60 = fsub double %59, %56
  %61 = fadd double %57, %60
  %62 = fmul double %48, %61
  %63 = fadd double %49, %62
  %64 = fsub double %63, %49
  %65 = fsub double %62, %64
  %66 = fmul double %63, %63
  %67 = tail call double @llvm.fma.f64(double %66, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %68 = tail call double @llvm.fma.f64(double %66, double %67, double 0x3FC7474DD7F4DF2E)
  %69 = tail call double @llvm.fma.f64(double %66, double %68, double 0x3FCC71C016291751)
  %70 = tail call double @llvm.fma.f64(double %66, double %69, double 0x3FD249249B27ACF1)
  %71 = tail call double @llvm.fma.f64(double %66, double %70, double 0x3FD99999998EF7B6)
  %72 = tail call double @llvm.fma.f64(double %66, double %71, double 0x3FE5555555555780)
  %73 = tail call double @llvm.amdgcn.ldexp.f64(double %63, i32 1)
  %74 = tail call double @llvm.amdgcn.ldexp.f64(double %65, i32 1)
  %75 = fmul double %63, %66
  %76 = fmul double %75, %72
  %77 = fadd double %73, %76
  %78 = fsub double %77, %73
  %79 = fsub double %76, %78
  %80 = fadd double %74, %79
  %81 = fadd double %77, %80
  %82 = fsub double %81, %77
  %83 = fsub double %80, %82
  %84 = sitofp i32 %38 to double
  %85 = fmul double %84, 0x3FE62E42FEFA39EF
  %86 = fneg double %85
  %87 = tail call double @llvm.fma.f64(double %84, double 0x3FE62E42FEFA39EF, double %86)
  %88 = tail call double @llvm.fma.f64(double %84, double 0x3C7ABC9E3B39803F, double %87)
  %89 = fadd double %85, %88
  %90 = fsub double %89, %85
  %91 = fsub double %88, %90
  %92 = fadd double %89, %81
  %93 = fsub double %92, %89
  %94 = fsub double %92, %93
  %95 = fsub double %89, %94
  %96 = fsub double %81, %93
  %97 = fadd double %96, %95
  %98 = fadd double %91, %83
  %99 = fsub double %98, %91
  %100 = fsub double %98, %99
  %101 = fsub double %91, %100
  %102 = fsub double %83, %99
  %103 = fadd double %102, %101
  %104 = fadd double %98, %97
  %105 = fadd double %92, %104
  %106 = fsub double %105, %92
  %107 = fsub double %104, %106
  %108 = fadd double %103, %107
  %109 = fadd double %105, %108
  %110 = tail call double @llvm.fabs.f64(double %32) #3
  %111 = fcmp oeq double %110, 0x7FF0000000000000
  %112 = select i1 %111, double %32, double %109
  %113 = fcmp olt double %32, 0.000000e+00
  %114 = select i1 %113, double 0x7FF8000000000000, double %112
  %115 = fcmp oeq double %32, 0.000000e+00
  %116 = select i1 %115, double 0xFFF0000000000000, double %114
  %117 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  store double %116, double addrspace(1)* %117, align 8, !tbaa !7
  br label %118

118:                                              ; preds = %25, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
