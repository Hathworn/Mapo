; ModuleID = '../data/hip_kernels/8183/0/main.cu'
source_filename = "../data/hip_kernels/8183/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.RGB_8 = type { i8, i8, i8 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15gray_scale_flipP5RGB_8ii(%struct.RGB_8 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 2, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %5, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %12, %1
  %22 = sdiv i32 %2, 2
  %23 = icmp slt i32 %20, %22
  %24 = select i1 %21, i1 %23, i1 false
  br i1 %24, label %25, label %66

25:                                               ; preds = %3
  %26 = mul nsw i32 %12, %2
  %27 = add nsw i32 %26, %20
  %28 = add nsw i32 %12, 1
  %29 = mul nsw i32 %28, %2
  %30 = xor i32 %20, -1
  %31 = add i32 %29, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.RGB_8, %struct.RGB_8 addrspace(1)* %0, i64 %32, i32 0
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa.struct !7, !amdgpu.noclobber !5
  %35 = getelementptr inbounds %struct.RGB_8, %struct.RGB_8 addrspace(1)* %0, i64 %32, i32 1
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa.struct !7, !amdgpu.noclobber !5
  %37 = getelementptr inbounds %struct.RGB_8, %struct.RGB_8 addrspace(1)* %0, i64 %32, i32 2
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa.struct !7, !amdgpu.noclobber !5
  %39 = sext i32 %27 to i64
  %40 = getelementptr inbounds %struct.RGB_8, %struct.RGB_8 addrspace(1)* %0, i64 %39, i32 0
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !11, !amdgpu.noclobber !5
  %42 = uitofp i8 %41 to double
  %43 = fmul contract double %42, 2.100000e-01
  %44 = getelementptr inbounds %struct.RGB_8, %struct.RGB_8 addrspace(1)* %0, i64 %39, i32 1
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !13, !amdgpu.noclobber !5
  %46 = uitofp i8 %45 to double
  %47 = fmul contract double %46, 0x3FE70A3D70A3D70A
  %48 = fadd contract double %43, %47
  %49 = getelementptr inbounds %struct.RGB_8, %struct.RGB_8 addrspace(1)* %0, i64 %39, i32 2
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !14, !amdgpu.noclobber !5
  %51 = uitofp i8 %50 to double
  %52 = fmul contract double %51, 7.000000e-02
  %53 = fadd contract double %48, %52
  %54 = fptrunc double %53 to float
  %55 = fptoui float %54 to i8
  store i8 %55, i8 addrspace(1)* %40, align 1, !tbaa !11
  store i8 %55, i8 addrspace(1)* %44, align 1, !tbaa !13
  store i8 %55, i8 addrspace(1)* %49, align 1, !tbaa !14
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 1 dereferenceable(3) %33, i8 addrspace(1)* noundef align 1 dereferenceable(3) %40, i64 3, i1 false), !tbaa.struct !7
  %56 = uitofp i8 %34 to double
  %57 = fmul contract double %56, 2.100000e-01
  %58 = uitofp i8 %36 to double
  %59 = fmul contract double %58, 0x3FE70A3D70A3D70A
  %60 = fadd contract double %57, %59
  %61 = uitofp i8 %38 to double
  %62 = fmul contract double %61, 7.000000e-02
  %63 = fadd contract double %60, %62
  %64 = fptrunc double %63 to float
  %65 = fptoui float %64 to i8
  store i8 %65, i8 addrspace(1)* %40, align 1, !tbaa !11
  store i8 %65, i8 addrspace(1)* %44, align 1, !tbaa !13
  store i8 %65, i8 addrspace(1)* %49, align 1, !tbaa !14
  br label %66

66:                                               ; preds = %25, %3
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

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }

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
!7 = !{i64 0, i64 1, !8, i64 1, i64 1, !8, i64 2, i64 1, !8}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !9, i64 0}
!12 = !{!"_ZTS5RGB_8", !9, i64 0, !9, i64 1, !9, i64 2}
!13 = !{!12, !9, i64 1}
!14 = !{!12, !9, i64 2}
