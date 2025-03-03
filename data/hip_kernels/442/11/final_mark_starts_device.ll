; ModuleID = '../data/hip_kernels/442/11/main.cu'
source_filename = "../data/hip_kernels/442/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17final_mark_startsPhPjS0_jj(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %4
  br i1 %15, label %16, label %94

16:                                               ; preds = %5
  %17 = add i32 %14, -1
  %18 = urem i32 %17, %4
  %19 = zext i32 %14 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = zext i32 %18 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = mul i32 %21, 30
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %26
  %28 = mul i32 %3, 3
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 %29
  %31 = mul i32 %24, 30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %33, i64 %29
  %35 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !11, !amdgpu.noclobber !5
  %36 = zext i8 %35 to i64
  %37 = shl nuw nsw i64 %36, 40
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 1
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !11, !amdgpu.noclobber !5
  %40 = zext i8 %39 to i64
  %41 = shl nuw nsw i64 %40, 32
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 2
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !11, !amdgpu.noclobber !5
  %44 = zext i8 %43 to i32
  %45 = shl nuw i32 %44, 24
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 3
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !11, !amdgpu.noclobber !5
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 16
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 4
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !11, !amdgpu.noclobber !5
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 8
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 5
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !11, !amdgpu.noclobber !5
  %57 = zext i8 %56 to i64
  %58 = or i64 %41, %37
  %59 = or i64 %58, %46
  %60 = or i64 %54, %50
  %61 = or i64 %60, %57
  %62 = or i64 %61, %59
  %63 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !11, !amdgpu.noclobber !5
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 40
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %34, i64 1
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !11, !amdgpu.noclobber !5
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 32
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %34, i64 2
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !11, !amdgpu.noclobber !5
  %72 = zext i8 %71 to i32
  %73 = shl nuw i32 %72, 24
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %34, i64 3
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !11, !amdgpu.noclobber !5
  %77 = zext i8 %76 to i64
  %78 = shl nuw nsw i64 %77, 16
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %34, i64 4
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !11, !amdgpu.noclobber !5
  %81 = zext i8 %80 to i64
  %82 = shl nuw nsw i64 %81, 8
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %34, i64 5
  %84 = load i8, i8 addrspace(1)* %83, align 1, !tbaa !11, !amdgpu.noclobber !5
  %85 = zext i8 %84 to i64
  %86 = or i64 %69, %65
  %87 = or i64 %86, %74
  %88 = or i64 %82, %78
  %89 = or i64 %88, %85
  %90 = or i64 %89, %87
  %91 = icmp eq i64 %62, %90
  br i1 %91, label %94, label %92

92:                                               ; preds = %16
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %19
  store i32 1, i32 addrspace(1)* %93, align 4, !tbaa !7
  br label %94

94:                                               ; preds = %16, %92, %5
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
