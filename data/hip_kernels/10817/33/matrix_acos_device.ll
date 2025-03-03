; ModuleID = '../data/hip_kernels/10817/33/main.cu'
source_filename = "../data/hip_kernels/10817/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @matrix_acos(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %88

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !5
  %18 = tail call double @llvm.fabs.f64(double %17)
  %19 = fcmp oge double %18, 5.000000e-01
  %20 = tail call double @llvm.fma.f64(double %18, double -5.000000e-01, double 5.000000e-01)
  %21 = fmul double %17, %17
  %22 = select i1 %19, double %20, double %21
  %23 = tail call double @llvm.fma.f64(double %22, double 0x3FA059859FEA6A70, double 0xBF90A5A378A05EAF)
  %24 = tail call double @llvm.fma.f64(double %22, double %23, double 0x3F94052137024D6A)
  %25 = tail call double @llvm.fma.f64(double %22, double %24, double 0x3F7AB3A098A70509)
  %26 = tail call double @llvm.fma.f64(double %22, double %25, double 0x3F88ED60A300C8D2)
  %27 = tail call double @llvm.fma.f64(double %22, double %26, double 0x3F8C6FA84B77012B)
  %28 = tail call double @llvm.fma.f64(double %22, double %27, double 0x3F91C6C111DCCB70)
  %29 = tail call double @llvm.fma.f64(double %22, double %28, double 0x3F96E89F0A0ADACF)
  %30 = tail call double @llvm.fma.f64(double %22, double %29, double 0x3F9F1C72C668963F)
  %31 = tail call double @llvm.fma.f64(double %22, double %30, double 0x3FA6DB6DB41CE4BD)
  %32 = tail call double @llvm.fma.f64(double %22, double %31, double 0x3FB333333336FD5B)
  %33 = tail call double @llvm.fma.f64(double %22, double %32, double 0x3FC5555555555380)
  %34 = fmul double %22, %33
  %35 = tail call double @llvm.fma.f64(double %17, double %34, double %17)
  %36 = fneg double %35
  %37 = tail call double @llvm.fma.f64(double 0x3FEDD9AD336A0500, double 0x3FFAF154EEB562D6, double %36)
  br i1 %19, label %38, label %85

38:                                               ; preds = %14
  %39 = tail call double @llvm.amdgcn.rsq.f64(double %22)
  %40 = fmul double %22, %39
  %41 = fmul double %39, 5.000000e-01
  %42 = fneg double %41
  %43 = tail call double @llvm.fma.f64(double %42, double %40, double 5.000000e-01)
  %44 = tail call double @llvm.fma.f64(double %41, double %43, double %41)
  %45 = tail call double @llvm.fma.f64(double %40, double %43, double %40)
  %46 = fneg double %45
  %47 = tail call double @llvm.fma.f64(double %46, double %45, double %22)
  %48 = tail call double @llvm.fma.f64(double %47, double %44, double %45)
  %49 = fcmp oeq double %22, 0.000000e+00
  %50 = select i1 %49, double %22, double %48
  %51 = fmul double %50, %50
  %52 = fneg double %51
  %53 = tail call double @llvm.fma.f64(double %50, double %50, double %52)
  %54 = fsub double %22, %51
  %55 = fsub double %22, %54
  %56 = fsub double %55, %51
  %57 = fsub double %56, %53
  %58 = fadd double %54, %57
  %59 = fmul double %50, 2.000000e+00
  %60 = tail call double @llvm.amdgcn.rcp.f64(double %59)
  %61 = fneg double %59
  %62 = tail call double @llvm.fma.f64(double %61, double %60, double 1.000000e+00)
  %63 = tail call double @llvm.fma.f64(double %62, double %60, double %60)
  %64 = tail call double @llvm.fma.f64(double %61, double %63, double 1.000000e+00)
  %65 = tail call double @llvm.fma.f64(double %64, double %63, double %63)
  %66 = fmul double %58, %65
  %67 = tail call double @llvm.fma.f64(double %61, double %66, double %58)
  %68 = tail call double @llvm.fma.f64(double %67, double %65, double %66)
  %69 = select i1 %49, double 0.000000e+00, double %68
  %70 = fadd double %50, %69
  %71 = fsub double %70, %50
  %72 = fsub double %69, %71
  %73 = tail call double @llvm.fma.f64(double %70, double %34, double %70)
  %74 = fmul double %73, -2.000000e+00
  %75 = tail call double @llvm.fma.f64(double 0x3FFDD9AD336A0500, double 0x3FFAF154EEB562D6, double %74)
  %76 = tail call double @llvm.fma.f64(double %70, double %34, double %72)
  %77 = fadd double %70, %76
  %78 = fmul double %77, 2.000000e+00
  %79 = fcmp olt double %17, 0.000000e+00
  %80 = select i1 %79, double %75, double %78
  %81 = fcmp oeq double %17, -1.000000e+00
  %82 = select i1 %81, double 0x400921FB54442D18, double %80
  %83 = fcmp oeq double %17, 1.000000e+00
  %84 = select i1 %83, double 0.000000e+00, double %82
  br label %85

85:                                               ; preds = %14, %38
  %86 = phi double [ %84, %38 ], [ %37, %14 ]
  %87 = getelementptr inbounds double, double addrspace(1)* %1, i64 %15
  store double %86, double addrspace(1)* %87, align 8, !tbaa !7
  br label %88

88:                                               ; preds = %85, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
