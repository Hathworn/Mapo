; ModuleID = '../data/hip_kernels/12483/34/main.cu'
source_filename = "../data/hip_kernels/12483/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11jacobi_initiiiPKdS0_ddPdS1_S1_S1_i(i32 %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double %5, double %6, double addrspace(1)* nocapture writeonly %7, double addrspace(1)* nocapture writeonly %8, double addrspace(1)* nocapture writeonly %9, double addrspace(1)* nocapture writeonly %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = add i32 %20, %13
  %22 = mul nsw i32 %1, %0
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %88

24:                                               ; preds = %12
  %25 = shl nsw i32 %2, 1
  %26 = add nsw i32 %25, %0
  %27 = freeze i32 %21
  %28 = freeze i32 %0
  %29 = sdiv i32 %27, %28
  %30 = mul i32 %29, %28
  %31 = sub i32 %27, %30
  %32 = add nsw i32 %26, 1
  %33 = mul nsw i32 %32, %2
  %34 = add nsw i32 %31, %33
  %35 = mul nsw i32 %29, %26
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %4, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !6
  %40 = getelementptr inbounds double, double addrspace(1)* %3, i64 %37
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !6
  %42 = fmul contract double %39, %41
  %43 = getelementptr inbounds double, double addrspace(1)* %9, i64 %37
  store double %42, double addrspace(1)* %43, align 8, !tbaa !7
  %44 = getelementptr inbounds double, double addrspace(1)* %10, i64 %37
  store double %42, double addrspace(1)* %44, align 8, !tbaa !7
  %45 = icmp eq i32 %29, 0
  %46 = icmp eq i32 %31, 0
  %47 = or i1 %46, %45
  br i1 %47, label %88, label %48

48:                                               ; preds = %24
  switch i32 %11, label %72 [
    i32 1, label %49
    i32 2, label %59
  ]

49:                                               ; preds = %48
  %50 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %51 = add nsw i32 %36, -1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %3, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7
  %55 = sub nsw i32 %36, %26
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %3, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7
  br label %72

59:                                               ; preds = %48
  %60 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %61 = fdiv contract double 1.000000e+00, %60
  %62 = add nsw i32 %36, -1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %3, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  %66 = fdiv contract double 1.000000e+00, %65
  %67 = sub nsw i32 %36, %26
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %3, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7
  %71 = fdiv contract double 1.000000e+00, %70
  br label %72

72:                                               ; preds = %48, %59, %49
  %73 = phi double [ %50, %49 ], [ %61, %59 ], [ undef, %48 ]
  %74 = phi double [ %54, %49 ], [ %66, %59 ], [ undef, %48 ]
  %75 = phi double [ %58, %49 ], [ %71, %59 ], [ undef, %48 ]
  %76 = fadd contract double %73, %74
  %77 = fmul contract double %76, %5
  %78 = fmul contract double %74, 2.000000e+00
  %79 = fmul contract double %73, %78
  %80 = fdiv contract double %77, %79
  %81 = getelementptr inbounds double, double addrspace(1)* %7, i64 %37
  store double %80, double addrspace(1)* %81, align 8, !tbaa !7
  %82 = fadd contract double %73, %75
  %83 = fmul contract double %82, %6
  %84 = fmul contract double %75, 2.000000e+00
  %85 = fmul contract double %73, %84
  %86 = fdiv contract double %83, %85
  %87 = getelementptr inbounds double, double addrspace(1)* %8, i64 %37
  store double %86, double addrspace(1)* %87, align 8, !tbaa !7
  br label %88

88:                                               ; preds = %72, %24, %12
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
