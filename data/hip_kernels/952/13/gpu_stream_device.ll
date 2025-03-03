; ModuleID = '../data/hip_kernels/952/13/main.cu'
source_filename = "../data/hip_kernels/952/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10gpu_streamPdS_S_S_S_S_(double addrspace(1)* nocapture readnone %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readnone %3, double addrspace(1)* nocapture writeonly %4, double addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = add i32 %16, 1
  %18 = urem i32 %17, 122
  %19 = add i32 %7, 1
  %20 = urem i32 %19, 101
  %21 = add i32 %16, 121
  %22 = urem i32 %21, 122
  %23 = add i32 %7, 100
  %24 = urem i32 %23, 101
  %25 = mul i32 %7, 122
  %26 = add i32 %22, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %2, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7, !amdgpu.noclobber !5
  %30 = add i32 %16, %25
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %1, i64 %31
  store double %29, double addrspace(1)* %32, align 8, !tbaa !7
  %33 = mul nuw nsw i32 %24, 122
  %34 = add i32 %16, 12322
  %35 = add i32 %34, %33
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %2, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7
  %39 = add i32 %34, %25
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  store double %38, double addrspace(1)* %41, align 8, !tbaa !7
  %42 = add i32 %25, 24644
  %43 = add i32 %18, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %2, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7
  %47 = add i32 %16, %42
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  store double %46, double addrspace(1)* %49, align 8, !tbaa !7
  %50 = mul nuw nsw i32 %20, 122
  %51 = add i32 %16, 36966
  %52 = add i32 %51, %50
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %2, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7
  %56 = add i32 %51, %25
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  store double %55, double addrspace(1)* %58, align 8, !tbaa !7
  %59 = add nuw nsw i32 %33, 49288
  %60 = add nuw nsw i32 %59, %22
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %2, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7
  %64 = add i32 %25, 49288
  %65 = add i32 %64, %16
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %1, i64 %66
  store double %63, double addrspace(1)* %67, align 8, !tbaa !7
  %68 = add nuw nsw i32 %33, 61610
  %69 = add nuw nsw i32 %68, %18
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %2, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7
  %73 = add i32 %25, 61610
  %74 = add i32 %73, %16
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %1, i64 %75
  store double %72, double addrspace(1)* %76, align 8, !tbaa !7
  %77 = add nuw nsw i32 %50, 73932
  %78 = add nuw nsw i32 %77, %18
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %2, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7
  %82 = add i32 %25, 73932
  %83 = add i32 %82, %16
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %1, i64 %84
  store double %81, double addrspace(1)* %85, align 8, !tbaa !7
  %86 = add nuw nsw i32 %50, 86254
  %87 = add nuw nsw i32 %86, %22
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %2, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !7
  %91 = add i32 %25, 86254
  %92 = add i32 %91, %16
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %1, i64 %93
  store double %90, double addrspace(1)* %94, align 8, !tbaa !7
  %95 = getelementptr inbounds double, double addrspace(1)* %5, i64 %27
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !7
  %97 = getelementptr inbounds double, double addrspace(1)* %4, i64 %31
  store double %96, double addrspace(1)* %97, align 8, !tbaa !7
  %98 = getelementptr inbounds double, double addrspace(1)* %5, i64 %36
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7
  %100 = getelementptr inbounds double, double addrspace(1)* %4, i64 %40
  store double %99, double addrspace(1)* %100, align 8, !tbaa !7
  %101 = getelementptr inbounds double, double addrspace(1)* %5, i64 %44
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !7
  %103 = getelementptr inbounds double, double addrspace(1)* %4, i64 %48
  store double %102, double addrspace(1)* %103, align 8, !tbaa !7
  %104 = getelementptr inbounds double, double addrspace(1)* %5, i64 %53
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7
  %106 = getelementptr inbounds double, double addrspace(1)* %4, i64 %57
  store double %105, double addrspace(1)* %106, align 8, !tbaa !7
  %107 = getelementptr inbounds double, double addrspace(1)* %5, i64 %61
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7
  %109 = getelementptr inbounds double, double addrspace(1)* %4, i64 %66
  store double %108, double addrspace(1)* %109, align 8, !tbaa !7
  %110 = getelementptr inbounds double, double addrspace(1)* %5, i64 %70
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !7
  %112 = getelementptr inbounds double, double addrspace(1)* %4, i64 %75
  store double %111, double addrspace(1)* %112, align 8, !tbaa !7
  %113 = getelementptr inbounds double, double addrspace(1)* %5, i64 %79
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !7
  %115 = getelementptr inbounds double, double addrspace(1)* %4, i64 %84
  store double %114, double addrspace(1)* %115, align 8, !tbaa !7
  %116 = getelementptr inbounds double, double addrspace(1)* %5, i64 %88
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !7
  %118 = getelementptr inbounds double, double addrspace(1)* %4, i64 %93
  store double %117, double addrspace(1)* %118, align 8, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
