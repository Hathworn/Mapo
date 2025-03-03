; ModuleID = '../data/hip_kernels/15276/25/main.cu'
source_filename = "../data/hip_kernels/15276/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z18kernel_test1_writePcS_Pj(i8 addrspace(1)* %0, i8 addrspace(1)* readnone %1, i32 addrspace(1)* nocapture readnone %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 20
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %6
  %8 = bitcast i8 addrspace(1)* %7 to i64 addrspace(1)*
  %9 = icmp ult i8 addrspace(1)* %7, %1
  br i1 %9, label %10, label %173

10:                                               ; preds = %3, %10
  %11 = phi i32 [ %171, %10 ], [ 0, %3 ]
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %12
  %14 = addrspacecast i64 addrspace(1)* %13 to i64*
  %15 = ptrtoint i64* %14 to i64
  store i64 %15, i64 addrspace(1)* %13, align 8, !tbaa !4
  %16 = or i32 %11, 1
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %17
  %19 = addrspacecast i64 addrspace(1)* %18 to i64*
  %20 = ptrtoint i64* %19 to i64
  store i64 %20, i64 addrspace(1)* %18, align 8, !tbaa !4
  %21 = or i32 %11, 2
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %22
  %24 = addrspacecast i64 addrspace(1)* %23 to i64*
  %25 = ptrtoint i64* %24 to i64
  store i64 %25, i64 addrspace(1)* %23, align 8, !tbaa !4
  %26 = or i32 %11, 3
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %27
  %29 = addrspacecast i64 addrspace(1)* %28 to i64*
  %30 = ptrtoint i64* %29 to i64
  store i64 %30, i64 addrspace(1)* %28, align 8, !tbaa !4
  %31 = or i32 %11, 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %32
  %34 = addrspacecast i64 addrspace(1)* %33 to i64*
  %35 = ptrtoint i64* %34 to i64
  store i64 %35, i64 addrspace(1)* %33, align 8, !tbaa !4
  %36 = or i32 %11, 5
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %37
  %39 = addrspacecast i64 addrspace(1)* %38 to i64*
  %40 = ptrtoint i64* %39 to i64
  store i64 %40, i64 addrspace(1)* %38, align 8, !tbaa !4
  %41 = or i32 %11, 6
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %42
  %44 = addrspacecast i64 addrspace(1)* %43 to i64*
  %45 = ptrtoint i64* %44 to i64
  store i64 %45, i64 addrspace(1)* %43, align 8, !tbaa !4
  %46 = or i32 %11, 7
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %47
  %49 = addrspacecast i64 addrspace(1)* %48 to i64*
  %50 = ptrtoint i64* %49 to i64
  store i64 %50, i64 addrspace(1)* %48, align 8, !tbaa !4
  %51 = or i32 %11, 8
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %52
  %54 = addrspacecast i64 addrspace(1)* %53 to i64*
  %55 = ptrtoint i64* %54 to i64
  store i64 %55, i64 addrspace(1)* %53, align 8, !tbaa !4
  %56 = or i32 %11, 9
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %57
  %59 = addrspacecast i64 addrspace(1)* %58 to i64*
  %60 = ptrtoint i64* %59 to i64
  store i64 %60, i64 addrspace(1)* %58, align 8, !tbaa !4
  %61 = or i32 %11, 10
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %62
  %64 = addrspacecast i64 addrspace(1)* %63 to i64*
  %65 = ptrtoint i64* %64 to i64
  store i64 %65, i64 addrspace(1)* %63, align 8, !tbaa !4
  %66 = or i32 %11, 11
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %67
  %69 = addrspacecast i64 addrspace(1)* %68 to i64*
  %70 = ptrtoint i64* %69 to i64
  store i64 %70, i64 addrspace(1)* %68, align 8, !tbaa !4
  %71 = or i32 %11, 12
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %72
  %74 = addrspacecast i64 addrspace(1)* %73 to i64*
  %75 = ptrtoint i64* %74 to i64
  store i64 %75, i64 addrspace(1)* %73, align 8, !tbaa !4
  %76 = or i32 %11, 13
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %77
  %79 = addrspacecast i64 addrspace(1)* %78 to i64*
  %80 = ptrtoint i64* %79 to i64
  store i64 %80, i64 addrspace(1)* %78, align 8, !tbaa !4
  %81 = or i32 %11, 14
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %82
  %84 = addrspacecast i64 addrspace(1)* %83 to i64*
  %85 = ptrtoint i64* %84 to i64
  store i64 %85, i64 addrspace(1)* %83, align 8, !tbaa !4
  %86 = or i32 %11, 15
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %87
  %89 = addrspacecast i64 addrspace(1)* %88 to i64*
  %90 = ptrtoint i64* %89 to i64
  store i64 %90, i64 addrspace(1)* %88, align 8, !tbaa !4
  %91 = or i32 %11, 16
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %92
  %94 = addrspacecast i64 addrspace(1)* %93 to i64*
  %95 = ptrtoint i64* %94 to i64
  store i64 %95, i64 addrspace(1)* %93, align 8, !tbaa !4
  %96 = or i32 %11, 17
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %97
  %99 = addrspacecast i64 addrspace(1)* %98 to i64*
  %100 = ptrtoint i64* %99 to i64
  store i64 %100, i64 addrspace(1)* %98, align 8, !tbaa !4
  %101 = or i32 %11, 18
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %102
  %104 = addrspacecast i64 addrspace(1)* %103 to i64*
  %105 = ptrtoint i64* %104 to i64
  store i64 %105, i64 addrspace(1)* %103, align 8, !tbaa !4
  %106 = or i32 %11, 19
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %107
  %109 = addrspacecast i64 addrspace(1)* %108 to i64*
  %110 = ptrtoint i64* %109 to i64
  store i64 %110, i64 addrspace(1)* %108, align 8, !tbaa !4
  %111 = or i32 %11, 20
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %112
  %114 = addrspacecast i64 addrspace(1)* %113 to i64*
  %115 = ptrtoint i64* %114 to i64
  store i64 %115, i64 addrspace(1)* %113, align 8, !tbaa !4
  %116 = or i32 %11, 21
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %117
  %119 = addrspacecast i64 addrspace(1)* %118 to i64*
  %120 = ptrtoint i64* %119 to i64
  store i64 %120, i64 addrspace(1)* %118, align 8, !tbaa !4
  %121 = or i32 %11, 22
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %122
  %124 = addrspacecast i64 addrspace(1)* %123 to i64*
  %125 = ptrtoint i64* %124 to i64
  store i64 %125, i64 addrspace(1)* %123, align 8, !tbaa !4
  %126 = or i32 %11, 23
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %127
  %129 = addrspacecast i64 addrspace(1)* %128 to i64*
  %130 = ptrtoint i64* %129 to i64
  store i64 %130, i64 addrspace(1)* %128, align 8, !tbaa !4
  %131 = or i32 %11, 24
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %132
  %134 = addrspacecast i64 addrspace(1)* %133 to i64*
  %135 = ptrtoint i64* %134 to i64
  store i64 %135, i64 addrspace(1)* %133, align 8, !tbaa !4
  %136 = or i32 %11, 25
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %137
  %139 = addrspacecast i64 addrspace(1)* %138 to i64*
  %140 = ptrtoint i64* %139 to i64
  store i64 %140, i64 addrspace(1)* %138, align 8, !tbaa !4
  %141 = or i32 %11, 26
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %142
  %144 = addrspacecast i64 addrspace(1)* %143 to i64*
  %145 = ptrtoint i64* %144 to i64
  store i64 %145, i64 addrspace(1)* %143, align 8, !tbaa !4
  %146 = or i32 %11, 27
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %147
  %149 = addrspacecast i64 addrspace(1)* %148 to i64*
  %150 = ptrtoint i64* %149 to i64
  store i64 %150, i64 addrspace(1)* %148, align 8, !tbaa !4
  %151 = or i32 %11, 28
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %152
  %154 = addrspacecast i64 addrspace(1)* %153 to i64*
  %155 = ptrtoint i64* %154 to i64
  store i64 %155, i64 addrspace(1)* %153, align 8, !tbaa !4
  %156 = or i32 %11, 29
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %157
  %159 = addrspacecast i64 addrspace(1)* %158 to i64*
  %160 = ptrtoint i64* %159 to i64
  store i64 %160, i64 addrspace(1)* %158, align 8, !tbaa !4
  %161 = or i32 %11, 30
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %162
  %164 = addrspacecast i64 addrspace(1)* %163 to i64*
  %165 = ptrtoint i64* %164 to i64
  store i64 %165, i64 addrspace(1)* %163, align 8, !tbaa !4
  %166 = or i32 %11, 31
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds i64, i64 addrspace(1)* %8, i64 %167
  %169 = addrspacecast i64 addrspace(1)* %168 to i64*
  %170 = ptrtoint i64* %169 to i64
  store i64 %170, i64 addrspace(1)* %168, align 8, !tbaa !4
  %171 = add nuw nsw i32 %11, 32
  %172 = icmp eq i32 %171, 131072
  br i1 %172, label %173, label %10, !llvm.loop !8

173:                                              ; preds = %10, %3
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
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
