; ModuleID = '../data/hip_kernels/14714/14/main.cu'
source_filename = "../data/hip_kernels/14714/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z21kernel_movinv32_writePcS_jjjj(i8 addrspace(1)* writeonly %0, i8 addrspace(1)* readnone %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 20
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %9
  %11 = bitcast i8 addrspace(1)* %10 to i32 addrspace(1)*
  %12 = icmp ult i8 addrspace(1)* %10, %1
  br i1 %12, label %13, label %90

13:                                               ; preds = %6, %13
  %14 = phi i32 [ %87, %13 ], [ %2, %6 ]
  %15 = phi i32 [ %86, %13 ], [ %5, %6 ]
  %16 = phi i32 [ %88, %13 ], [ 0, %6 ]
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %17
  store i32 %14, i32 addrspace(1)* %18, align 4, !tbaa !4
  %19 = add i32 %15, -31
  %20 = icmp ult i32 %19, -32
  %21 = shl i32 %14, 1
  %22 = or i32 %21, %4
  %23 = select i1 %20, i32 %3, i32 %22
  %24 = or i32 %16, 1
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %25
  store i32 %23, i32 addrspace(1)* %26, align 4, !tbaa !4
  %27 = add i32 %15, 2
  %28 = select i1 %20, i32 1, i32 %27
  %29 = icmp ugt i32 %28, 31
  %30 = shl i32 %23, 1
  %31 = or i32 %30, %4
  %32 = select i1 %29, i32 %3, i32 %31
  %33 = or i32 %16, 2
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %34
  store i32 %32, i32 addrspace(1)* %35, align 4, !tbaa !4
  %36 = add i32 %28, 1
  %37 = select i1 %29, i32 1, i32 %36
  %38 = icmp ugt i32 %37, 31
  %39 = shl i32 %32, 1
  %40 = or i32 %39, %4
  %41 = select i1 %38, i32 %3, i32 %40
  %42 = or i32 %16, 3
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %43
  store i32 %41, i32 addrspace(1)* %44, align 4, !tbaa !4
  %45 = add i32 %37, 1
  %46 = select i1 %38, i32 1, i32 %45
  %47 = icmp ugt i32 %46, 31
  %48 = shl i32 %41, 1
  %49 = or i32 %48, %4
  %50 = select i1 %47, i32 %3, i32 %49
  %51 = or i32 %16, 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %52
  store i32 %50, i32 addrspace(1)* %53, align 4, !tbaa !4
  %54 = add i32 %46, 1
  %55 = select i1 %47, i32 1, i32 %54
  %56 = icmp ugt i32 %55, 31
  %57 = shl i32 %50, 1
  %58 = or i32 %57, %4
  %59 = select i1 %56, i32 %3, i32 %58
  %60 = or i32 %16, 5
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %61
  store i32 %59, i32 addrspace(1)* %62, align 4, !tbaa !4
  %63 = add i32 %55, 1
  %64 = select i1 %56, i32 1, i32 %63
  %65 = icmp ugt i32 %64, 31
  %66 = shl i32 %59, 1
  %67 = or i32 %66, %4
  %68 = select i1 %65, i32 %3, i32 %67
  %69 = or i32 %16, 6
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %70
  store i32 %68, i32 addrspace(1)* %71, align 4, !tbaa !4
  %72 = add i32 %64, 1
  %73 = select i1 %65, i32 1, i32 %72
  %74 = icmp ugt i32 %73, 31
  %75 = shl i32 %68, 1
  %76 = or i32 %75, %4
  %77 = select i1 %74, i32 %3, i32 %76
  %78 = or i32 %16, 7
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %79
  store i32 %77, i32 addrspace(1)* %80, align 4, !tbaa !4
  %81 = add i32 %73, 1
  %82 = select i1 %74, i32 1, i32 %81
  %83 = icmp ugt i32 %82, 31
  %84 = shl i32 %77, 1
  %85 = or i32 %84, %4
  %86 = select i1 %83, i32 0, i32 %82
  %87 = select i1 %83, i32 %3, i32 %85
  %88 = add nuw nsw i32 %16, 8
  %89 = icmp eq i32 %88, 262144
  br i1 %89, label %90, label %13, !llvm.loop !8

90:                                               ; preds = %13, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
