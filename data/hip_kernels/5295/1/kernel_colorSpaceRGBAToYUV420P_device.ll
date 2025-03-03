; ModuleID = '../data/hip_kernels/5295/1/main.cu'
source_filename = "../data/hip_kernels/5295/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z30kernel_colorSpaceRGBAToYUV420PPmS_iiii(i64 addrspace(1)* nocapture writeonly %0, i64 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
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
  br i1 %26, label %27, label %99

27:                                               ; preds = %6
  %28 = bitcast i64 addrspace(1)* %1 to i32 addrspace(1)*
  %29 = mul i32 %23, %3
  %30 = lshr i32 %29, 2
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %28, i64 %31
  %33 = zext i32 %15 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %32, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = lshr i32 %35, 24
  %37 = lshr i32 %35, 16
  %38 = and i32 %37, 255
  %39 = lshr i32 %35, 8
  %40 = and i32 %39, 255
  %41 = sitofp i32 %36 to double
  %42 = fmul contract double %41, 2.990000e-01
  %43 = sitofp i32 %38 to double
  %44 = fmul contract double %43, 5.870000e-01
  %45 = fadd contract double %42, %44
  %46 = sitofp i32 %40 to double
  %47 = fmul contract double %46, 1.140000e-01
  %48 = fadd contract double %47, %45
  %49 = fptrunc double %48 to float
  %50 = fcmp contract olt float %49, 0.000000e+00
  %51 = fcmp contract oge float %49, 2.550000e+02
  %52 = select contract i1 %51, float 2.550000e+02, float %49
  %53 = fptoui float %52 to i8
  %54 = select i1 %50, i8 0, i8 %53
  %55 = bitcast i64 addrspace(1)* %0 to i8 addrspace(1)*
  %56 = mul i32 %23, %2
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %55, i64 %57
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %58, i64 %33
  store i8 %54, i8 addrspace(1)* %59, align 1, !tbaa !11
  %60 = fmul contract double %41, -1.687000e-01
  %61 = fmul contract double %43, 3.313000e-01
  %62 = fsub contract double %60, %61
  %63 = fmul contract double %46, 5.000000e-01
  %64 = fadd contract double %63, %62
  %65 = fadd contract double %64, 1.280000e+02
  %66 = fptrunc double %65 to float
  %67 = fcmp contract olt float %66, 0.000000e+00
  %68 = fcmp contract oge float %66, 2.550000e+02
  %69 = select contract i1 %68, float 2.550000e+02, float %66
  %70 = fptoui float %69 to i8
  %71 = select i1 %67, i8 0, i8 %70
  %72 = lshr i32 %23, 2
  %73 = add i32 %72, %5
  %74 = mul i32 %73, %2
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %55, i64 %75
  %77 = lshr i32 %15, 1
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %76, i64 %78
  store i8 %71, i8 addrspace(1)* %79, align 1, !tbaa !11
  %80 = fmul contract double %41, 5.000000e-01
  %81 = fmul contract double %43, 4.187000e-01
  %82 = fsub contract double %80, %81
  %83 = fmul contract double %46, 0x3FB4D013A92A3055
  %84 = fsub contract double %82, %83
  %85 = fadd contract double %84, 1.280000e+02
  %86 = fptrunc double %85 to float
  %87 = fcmp contract olt float %86, 0.000000e+00
  %88 = fcmp contract oge float %86, 2.550000e+02
  %89 = select contract i1 %88, float 2.550000e+02, float %86
  %90 = fptoui float %89 to i8
  %91 = select i1 %87, i8 0, i8 %90
  %92 = mul nsw i32 %5, 5
  %93 = add i32 %23, %92
  %94 = lshr i32 %93, 2
  %95 = mul i32 %94, %2
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %55, i64 %96
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %97, i64 %78
  store i8 %91, i8 addrspace(1)* %98, align 1, !tbaa !11
  br label %99

99:                                               ; preds = %27, %6
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
