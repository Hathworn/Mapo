; ModuleID = '../data/hip_kernels/11060/0/main.cu'
source_filename = "../data/hip_kernels/11060/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13matrixMulCUDAPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = mul nuw nsw i32 %4, 13
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %7
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = zext i32 %5 to i64
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %10
  %12 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = mul nsw i32 %12, %9
  %14 = add nuw nsw i32 %6, 1
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = add nuw nsw i32 %5, 13
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = mul nsw i32 %21, %17
  %23 = add nsw i32 %22, %13
  %24 = add nuw nsw i32 %6, 2
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = add nuw nsw i32 %5, 26
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = mul nsw i32 %31, %27
  %33 = add nsw i32 %32, %23
  %34 = add nuw nsw i32 %6, 3
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = add nuw nsw i32 %5, 39
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = mul nsw i32 %41, %37
  %43 = add nsw i32 %42, %33
  %44 = add nuw nsw i32 %6, 4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = add nuw nsw i32 %5, 52
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = mul nsw i32 %51, %47
  %53 = add nsw i32 %52, %43
  %54 = add nuw nsw i32 %6, 5
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = add nuw nsw i32 %5, 65
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = mul nsw i32 %61, %57
  %63 = add nsw i32 %62, %53
  %64 = add nuw nsw i32 %6, 6
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = add nuw nsw i32 %5, 78
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  %72 = mul nsw i32 %71, %67
  %73 = add nsw i32 %72, %63
  %74 = add nuw nsw i32 %6, 7
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  %78 = add nuw nsw i32 %5, 91
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = mul nsw i32 %81, %77
  %83 = add nsw i32 %82, %73
  %84 = add nuw nsw i32 %6, 8
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  %88 = add nuw nsw i32 %5, 104
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = mul nsw i32 %91, %87
  %93 = add nsw i32 %92, %83
  %94 = add nuw nsw i32 %6, 9
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !5, !amdgpu.noclobber !9
  %98 = add nuw nsw i32 %5, 117
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  %102 = mul nsw i32 %101, %97
  %103 = add nsw i32 %102, %93
  %104 = add nuw nsw i32 %6, 10
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !5, !amdgpu.noclobber !9
  %108 = add nuw nsw i32 %5, 130
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !5, !amdgpu.noclobber !9
  %112 = mul nsw i32 %111, %107
  %113 = add nsw i32 %112, %103
  %114 = add nuw nsw i32 %6, 11
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = add nuw nsw i32 %5, 143
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = mul nsw i32 %121, %117
  %123 = add nsw i32 %122, %113
  %124 = add nuw nsw i32 %6, 12
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = add nuw nsw i32 %5, 156
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %129
  %131 = load i32, i32 addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = mul nsw i32 %131, %127
  %133 = add nsw i32 %132, %123
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %134 = add nuw nsw i32 %6, %5
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %135
  %137 = load i32, i32 addrspace(1)* %136, align 4, !tbaa !5, !amdgpu.noclobber !9
  %138 = add nsw i32 %137, %133
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %135
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !5, !amdgpu.noclobber !9
  %141 = add nsw i32 %138, %140
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %135
  store i32 %141, i32 addrspace(1)* %142, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
