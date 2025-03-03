; ModuleID = '../data/hip_kernels/1227/5/main.cu'
source_filename = "../data/hip_kernels/1227/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ30mat_transpose_coalesced_kernelPiS_E4smem = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z30mat_transpose_coalesced_kernelPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = and i32 %3, -32
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = lshr i32 %5, 5
  %7 = and i32 %5, 31
  %8 = or i32 %4, %6
  %9 = shl i32 %3, 5
  %10 = and i32 %9, 992
  %11 = or i32 %7, %10
  %12 = or i32 %10, %6
  %13 = or i32 %4, %7
  %14 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ30mat_transpose_coalesced_kernelPiS_E4smem, i32 0, i32 %5
  %15 = shl nuw nsw i32 %7, 5
  %16 = or i32 %15, %6
  %17 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ30mat_transpose_coalesced_kernelPiS_E4smem, i32 0, i32 %16
  %18 = shl nuw nsw i32 %12, 10
  %19 = add i32 %13, %18
  %20 = shl nsw i32 %8, 10
  %21 = or i32 %20, %11
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !5
  store i32 %24, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %26 = sext i32 %19 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  store i32 %25, i32 addrspace(1)* %27, align 4, !tbaa !5
  %28 = shl i32 %8, 10
  %29 = add i32 %28, 65536
  %30 = or i32 %29, %11
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5
  store i32 %33, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %35 = add i32 %19, 64
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  store i32 %34, i32 addrspace(1)* %37, align 4, !tbaa !5
  %38 = shl i32 %8, 10
  %39 = add i32 %38, 131072
  %40 = or i32 %39, %11
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !5
  store i32 %43, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %45 = add i32 %19, 128
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  store i32 %44, i32 addrspace(1)* %47, align 4, !tbaa !5
  %48 = shl i32 %8, 10
  %49 = add i32 %48, 196608
  %50 = or i32 %49, %11
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !5
  store i32 %53, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %55 = add i32 %19, 192
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  store i32 %54, i32 addrspace(1)* %57, align 4, !tbaa !5
  %58 = shl i32 %8, 10
  %59 = add i32 %58, 262144
  %60 = or i32 %59, %11
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  store i32 %63, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %65 = add i32 %19, 256
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %66
  store i32 %64, i32 addrspace(1)* %67, align 4, !tbaa !5
  %68 = shl i32 %8, 10
  %69 = add i32 %68, 327680
  %70 = or i32 %69, %11
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !5
  store i32 %73, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %75 = add i32 %19, 320
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %76
  store i32 %74, i32 addrspace(1)* %77, align 4, !tbaa !5
  %78 = shl i32 %8, 10
  %79 = add i32 %78, 393216
  %80 = or i32 %79, %11
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !5
  store i32 %83, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %85 = add i32 %19, 384
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %86
  store i32 %84, i32 addrspace(1)* %87, align 4, !tbaa !5
  %88 = shl i32 %8, 10
  %89 = add i32 %88, 458752
  %90 = or i32 %89, %11
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !5
  store i32 %93, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %94 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %95 = add i32 %19, 448
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %96
  store i32 %94, i32 addrspace(1)* %97, align 4, !tbaa !5
  %98 = shl i32 %8, 10
  %99 = add i32 %98, 524288
  %100 = or i32 %99, %11
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !5
  store i32 %103, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %104 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %105 = add i32 %19, 512
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %106
  store i32 %104, i32 addrspace(1)* %107, align 4, !tbaa !5
  %108 = shl i32 %8, 10
  %109 = add i32 %108, 589824
  %110 = or i32 %109, %11
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !5
  store i32 %113, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %115 = add i32 %19, 576
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %116
  store i32 %114, i32 addrspace(1)* %117, align 4, !tbaa !5
  %118 = shl i32 %8, 10
  %119 = add i32 %118, 655360
  %120 = or i32 %119, %11
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !5
  store i32 %123, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %124 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %125 = add i32 %19, 640
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %126
  store i32 %124, i32 addrspace(1)* %127, align 4, !tbaa !5
  %128 = shl i32 %8, 10
  %129 = add i32 %128, 720896
  %130 = or i32 %129, %11
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %131
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !5
  store i32 %133, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %134 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %135 = add i32 %19, 704
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %136
  store i32 %134, i32 addrspace(1)* %137, align 4, !tbaa !5
  %138 = shl i32 %8, 10
  %139 = add i32 %138, 786432
  %140 = or i32 %139, %11
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !5
  store i32 %143, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %144 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %145 = add i32 %19, 768
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %146
  store i32 %144, i32 addrspace(1)* %147, align 4, !tbaa !5
  %148 = shl i32 %8, 10
  %149 = add i32 %148, 851968
  %150 = or i32 %149, %11
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %151
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !5
  store i32 %153, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %155 = add i32 %19, 832
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %156
  store i32 %154, i32 addrspace(1)* %157, align 4, !tbaa !5
  %158 = shl i32 %8, 10
  %159 = add i32 %158, 917504
  %160 = or i32 %159, %11
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %161
  %163 = load i32, i32 addrspace(1)* %162, align 4, !tbaa !5
  store i32 %163, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %164 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %165 = add i32 %19, 896
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %166
  store i32 %164, i32 addrspace(1)* %167, align 4, !tbaa !5
  %168 = shl i32 %8, 10
  %169 = add i32 %168, 983040
  %170 = or i32 %169, %11
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %171
  %173 = load i32, i32 addrspace(1)* %172, align 4, !tbaa !5
  store i32 %173, i32 addrspace(3)* %14, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %174 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %175 = add i32 %19, 960
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %176
  store i32 %174, i32 addrspace(1)* %177, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
