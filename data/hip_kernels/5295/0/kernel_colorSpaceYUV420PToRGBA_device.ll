; ModuleID = '../data/hip_kernels/5295/0/main.cu'
source_filename = "../data/hip_kernels/5295/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z30kernel_colorSpaceYUV420PToRGBAPmS_iiii(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp ult i32 %15, %4
  %25 = icmp ult i32 %23, %5
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %98

27:                                               ; preds = %6
  %28 = bitcast i64 addrspace(1)* %0 to i8 addrspace(1)*
  %29 = mul i32 %23, %2
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %28, i64 %30
  %32 = zext i32 %15 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7, !amdgpu.noclobber !5
  %35 = lshr i32 %23, 2
  %36 = add i32 %35, %5
  %37 = mul i32 %36, %2
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %28, i64 %38
  %40 = lshr i32 %15, 1
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %39, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !7, !amdgpu.noclobber !5
  %44 = zext i8 %43 to i32
  %45 = mul nsw i32 %5, 5
  %46 = add i32 %23, %45
  %47 = lshr i32 %46, 2
  %48 = mul i32 %47, %2
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %28, i64 %49
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %50, i64 %41
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !5
  %53 = zext i8 %52 to i32
  %54 = uitofp i8 %34 to double
  %55 = add nsw i32 %53, -128
  %56 = sitofp i32 %55 to double
  %57 = fmul contract double %56, 1.402000e+00
  %58 = fadd contract double %57, %54
  %59 = fadd contract double %58, 5.000000e-01
  %60 = fptrunc double %59 to float
  %61 = fcmp contract olt float %60, 0.000000e+00
  %62 = fcmp contract oge float %60, 2.550000e+02
  %63 = select contract i1 %62, float 2.550000e+02, float %60
  %64 = fptoui float %63 to i8
  %65 = select i1 %61, i8 0, i8 %64
  %66 = add nsw i32 %44, -128
  %67 = sitofp i32 %66 to double
  %68 = fmul contract double %67, 3.441400e-01
  %69 = fsub contract double %54, %68
  %70 = fmul contract double %56, 7.141400e-01
  %71 = fsub contract double %69, %70
  %72 = fadd contract double %71, 5.000000e-01
  %73 = fptrunc double %72 to float
  %74 = fcmp contract olt float %73, 0.000000e+00
  %75 = fcmp contract oge float %73, 2.550000e+02
  %76 = select contract i1 %75, float 2.550000e+02, float %73
  %77 = fptoui float %76 to i8
  %78 = select i1 %74, i8 0, i8 %77
  %79 = fmul contract double %67, 1.772000e+00
  %80 = fadd contract double %79, %54
  %81 = fadd contract double %80, 5.000000e-01
  %82 = fptrunc double %81 to float
  %83 = fcmp contract olt float %82, 0.000000e+00
  %84 = fcmp contract oge float %82, 2.550000e+02
  %85 = select contract i1 %84, float 2.550000e+02, float %82
  %86 = fptoui float %85 to i8
  %87 = select i1 %83, i8 0, i8 %86
  %88 = bitcast i64 addrspace(1)* %1 to i8 addrspace(1)*
  %89 = mul i32 %23, %3
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %88, i64 %90
  %92 = shl i32 %15, 2
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %91, i64 %93
  store i8 %65, i8 addrspace(1)* %94, align 1, !tbaa !7
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %94, i64 1
  store i8 %78, i8 addrspace(1)* %95, align 1, !tbaa !7
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %94, i64 2
  store i8 %87, i8 addrspace(1)* %96, align 1, !tbaa !7
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %94, i64 3
  store i8 -1, i8 addrspace(1)* %97, align 1, !tbaa !7
  br label %98

98:                                               ; preds = %27, %6
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
